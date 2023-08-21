// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:convert';

import 'package:aws_logging_cloudwatch/src/queued_item_store/queued_item_store.dart';

/// {@template aws_logging_cloudwatch.in_memory_queued_item_store}
/// Stores string elements in device memory.
/// {@endtemplate}
class InMemoryQueuedItemStore implements QueuedItemStore {
  /// {@macro aws_logging_cloudwatch.in_memory_queued_item_store}
  InMemoryQueuedItemStore();

  /// The next ID that should be used when adding an item in the DB.
  int _nextId = 0;
  int _currentTotalByteSize = 0;
  final LinkedHashMap<int, QueuedItem> _database =
      LinkedHashMap<int, QueuedItem>();

  @override
  void addItem(String string, String timestamp) {
    _currentTotalByteSize += utf8.encode(string).length;
    _currentTotalByteSize += utf8.encode(timestamp).length;
    _currentTotalByteSize += 8; // 8 bytes for the id
    _database[_nextId] = QueuedItem(
      id: _nextId,
      value: string,
      timestamp: timestamp,
    );
    _nextId++;
  }

  @override
  Iterable<QueuedItem> getCount(int count) {
    return _database.values.take(count).toList();
  }

  @override
  void deleteItems(Iterable<QueuedItem> items) {
    for (final item in items) {
      _currentTotalByteSize -= utf8.encode(item.value).length;
      _currentTotalByteSize -= utf8.encode(item.timestamp).length;
      _currentTotalByteSize -= 8; // 8 bytes for the id
      _database.remove(item.id);
    }
  }

  @override
  void clear() {
    _currentTotalByteSize = 0;
    _database.clear();
  }

  @override
  void close() {}

  @override
  Iterable<QueuedItem> getAll() {
    return _database.values.toList();
  }

  @override
  bool isFull(int maxSizeInMB) {
    final maxBytes = maxSizeInMB * 1024 * 1024;
    return _currentTotalByteSize >= maxBytes;
  }
}