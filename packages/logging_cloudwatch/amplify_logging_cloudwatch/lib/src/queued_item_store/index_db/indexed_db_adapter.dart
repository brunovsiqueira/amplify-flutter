// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:js_util';

import 'package:amplify_core/amplify_core.dart';
// ignore: implementation_imports
import 'package:aws_common/src/js/indexed_db.dart';
import 'package:aws_logging_cloudwatch/aws_logging_cloudwatch.dart';
import 'package:collection/collection.dart';

// TODO(kylechen): Consider merging/refactoring with existing 'amplify_secure_storage_web - _IndexedDBStorage' class
/// {@template amplify_logging_cloudwatch_dart.indexed_db_adapter}
/// Provide indexDB methods for storing/retrieving Strings.
/// {@endtemplate}
class IndexedDbAdapter implements QueuedItemStore {
  /// {@macro amplify_logging_cloudwatch_dart.indexed_db_adapter}
  IndexedDbAdapter();

  /// The name of the database.
  ///
  /// Reference: https://www.w3.org/TR/IndexedDB/#name
  String get databaseName => 'amplify_logging_cloudwatch';

  /// The name of the object store.
  ///
  /// Reference: https://www.w3.org/TR/IndexedDB/#object-store-name
  final storeName = 'logging_cached_logs';

  late final Future<void> _databaseOpenEvent = _openDatabase();

  late final IDBDatabase _database;

  int _currentTotalByteSize = 0;

  /// Checks for IDB availability and attempts to open the database.
  Future<void> _openDatabase() async {
    final db = indexedDB;
    if (db == null) {
      throw const InvalidStateException('IndexedDB is not available');
    }
    final openRequest = db.open(databaseName, 1)
      ..onupgradeneeded = (event) {
        final database = event.target.result;
        final objectStoreNames = database.objectStoreNames;
        if (!objectStoreNames.contains(storeName)) {
          database.createObjectStore(
            storeName,
            keyPath: 'id',
            autoIncrement: true,
          );
        }
      };
    _database = await openRequest.future;
  }

  /// Returns a new [IDBObjectStore] instance after waiting for initialization
  /// to complete.
  IDBObjectStore _getObjectStore() {
    final transaction = _database.transaction(
      storeName,
      mode: IDBTransactionMode.readwrite,
    );
    final store = transaction.objectStore(storeName);
    return store;
  }

  /// Calculates the size of a queued item by adding the length of the UTF-8 encoded [value],
  /// 23 bytes for the timestamp, and 8 bytes for the ID.
  ///
  /// Returns the total size of the queued item in bytes.
  int sizeOfQueuedItem(String value) {
    var size = 0;
    size += value.length;
    size += 23; // 23 bytes for the timestamp
    size += 8; // 8 bytes for the id
    return size;
  }

  @override
  Future<void> addItem(String string, String timestamp) async {
    _currentTotalByteSize += sizeOfQueuedItem(string);
    await _databaseOpenEvent;
    await _getObjectStore().add(string, timestamp).future;
  }

  @override
  Future<Iterable<QueuedItem>> getCount([int? count]) async {
    final readValues = <QueuedItem>[];

    await _databaseOpenEvent;
    final store = _getObjectStore();
    final request = store.getAll(null, count);

    await request.future;

    for (final elem in request.result) {
      final value = elem as Object;
      final id = getProperty<int>(value, 'id');
      final string = getProperty<String>(value, 'value');
      final timestamp = getProperty<String>(value, 'timestamp');
      readValues.add(
        QueuedItem(id: id, value: string, timestamp: timestamp),
      );
    }
    return readValues;
  }

  @override
  Future<void> deleteItems(Iterable<QueuedItem> items) async {
    if (items.isEmpty) return;

    for (final item in items) {
      _currentTotalByteSize -= sizeOfQueuedItem(item.value);
    }

    final idsToDelete = items.map((item) => item.id);

    await _databaseOpenEvent;
    final store = _getObjectStore();

    final ranges = idsToDelete.splitBetween((a, b) => b != a + 1).map(
          (range) => IDBKeyRange.bound(range.first, range.last),
        );
    await Future.wait<void>(
      ranges.map((range) => store.deleteByKeyRange(range).future),
    );
  }

  @override
  Future<Iterable<QueuedItem>> getAll() async {
    final readValues = <QueuedItem>[];

    await _databaseOpenEvent;
    final store = _getObjectStore();
    final request = store.getAll(null, null);

    await request.future;

    for (final elem in request.result) {
      final value = elem as Map<String, dynamic>;
      final id = value['id'] as int;
      final itemValue = value['value'] as String;
      final timestamp = value['timestamp'] as String;
      readValues.add(
        QueuedItem(id: id, value: itemValue, timestamp: timestamp),
      );
    }

    return readValues;
  }

  @override
  Future<bool> isFull(int maxSizeInMB) async {
    final maxBytes = maxSizeInMB * 1024 * 1024;
    return _currentTotalByteSize >= maxBytes;
  }

  /// Clear the database.
  @override
  Future<void> clear() async {
    await _databaseOpenEvent;
    await _getObjectStore().clear().future;
    _currentTotalByteSize = 0;
  }

  @override
  void close() {}

  /// Check that IndexDB will work on this device.
  static Future<bool> checkIsIndexedDBSupported() async {
    if (indexedDB == null) {
      return false;
    }
    // indexedDB will be non-null in Firefox private browsing,
    // but will fail to open.
    try {
      final openRequest = indexedDB!.open('test', 1);
      await openRequest.future;
      return true;
    } on Object {
      return false;
    }
  }
}
