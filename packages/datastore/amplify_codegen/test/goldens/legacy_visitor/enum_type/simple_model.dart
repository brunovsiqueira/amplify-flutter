// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: non_constant_identifier_names,inference_failure_on_collection_literal

library models.simple_model;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

import 'status.dart';

class SimpleModelType
    extends ModelType<String, SimpleModel, PartialSimpleModel> {
  const SimpleModelType();

  @override
  T fromJson<T extends PartialModel<String, SimpleModel>>(
    Map<String, Object?> json,
  ) {
    if (T == SimpleModel || T == Model<String, SimpleModel>) {
      return SimpleModel.fromJson(json) as T;
    }
    if (T == RemoteSimpleModel || T == RemoteModel<String, SimpleModel>) {
      return _RemoteSimpleModel.fromJson(json) as T;
    }
    return _PartialSimpleModel.fromJson(json) as T;
  }

  @override
  String get modelName => 'SimpleModel';
}

class SimpleModelQueryFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const SimpleModelQueryFields([this._root]);

  final QueryField<ModelIdentifier, M, SimpleModel>? _root;

  /// Query field for the [SimpleModel.id] field.
  QueryField<ModelIdentifier, M, String> get $id =>
      NestedQueryField<ModelIdentifier, M, String, SimpleModel, String>(
        const QueryField<String, SimpleModel, String>(fieldName: 'id'),
        root: _root,
      );

  /// Query field for the [SimpleModel.status] field.
  QueryField<ModelIdentifier, M, Status?> get $status =>
      NestedQueryField<ModelIdentifier, M, String, SimpleModel, Status?>(
        const QueryField<String, SimpleModel, Status?>(fieldName: 'status'),
        root: _root,
      );

  /// Query field for the [SimpleModel.createdAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $createdAt =>
      NestedQueryField<ModelIdentifier, M, String, SimpleModel,
          TemporalDateTime>(
        const QueryField<String, SimpleModel, TemporalDateTime>(
          fieldName: 'createdAt',
        ),
        root: _root,
      );

  /// Query field for the [SimpleModel.updatedAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $updatedAt =>
      NestedQueryField<ModelIdentifier, M, String, SimpleModel,
          TemporalDateTime>(
        const QueryField<String, SimpleModel, TemporalDateTime>(
          fieldName: 'updatedAt',
        ),
        root: _root,
      );

  /// Query field for the [SimpleModel] model identifier.
  QueryField<ModelIdentifier, M, String> get $modelIdentifier =>
      NestedQueryField<ModelIdentifier, M, String, SimpleModel, String>(
        const QueryField<String, SimpleModel, String>(
          fieldName: 'modelIdentifier',
        ),
        root: _root,
      );
}

abstract class PartialSimpleModel extends PartialModel<String, SimpleModel>
    with AWSEquatable<PartialSimpleModel> {
  const PartialSimpleModel._();

  String get id;
  Status? get status;
  TemporalDateTime? get createdAt;
  TemporalDateTime? get updatedAt;
  @override
  String get modelIdentifier => id;
  @override
  SimpleModelType get modelType => SimpleModel.classType;
  @override
  List<Object?> get props => [
        id,
        status,
        createdAt,
        updatedAt,
      ];
  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'status': status?.value,
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
        '_version': version,
        '_deleted': deleted,
        '_lastChangedAt': lastChangedAt?.format(),
      };
  @override
  String get runtimeTypeName => 'SimpleModel';
}

class _PartialSimpleModel extends PartialSimpleModel {
  const _PartialSimpleModel({
    required this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  }) : super._();

  factory _PartialSimpleModel.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'id',
          ))
        : (json['id'] as String);
    final status = json['status'] == null
        ? null
        : Status.fromJson((json['status'] as String));
    final createdAt = json['createdAt'] == null
        ? null
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? null
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    return _PartialSimpleModel(
      id: id,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  final String id;

  @override
  final Status? status;

  @override
  final TemporalDateTime? createdAt;

  @override
  final TemporalDateTime? updatedAt;
}

abstract class SimpleModel extends PartialSimpleModel
    with LegacyModelFields<String, SimpleModel>
    implements Model<String, SimpleModel> {
  factory SimpleModel({
    String? id,
    Status? status,
  }) = _SimpleModel;

  const SimpleModel._() : super._();

  factory SimpleModel.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'id',
          ))
        : (json['id'] as String);
    final status = json['status'] == null
        ? null
        : Status.fromJson((json['status'] as String));
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    return _SimpleModel._(
      id: id,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static const SimpleModelType classType = SimpleModelType();

  static const SimpleModelQueryFields<String, SimpleModel> _queryFields =
      SimpleModelQueryFields();

  static final mipr.ModelTypeDefinition schema =
      mipr.serializers.deserializeWith(
    mipr.ModelTypeDefinition.serializer,
    const {
      'name': 'SimpleModel',
      'pluralName': 'SimpleModels',
      'fields': {
        'id': {
          'name': 'id',
          'type': {'scalar': 'ID'},
          'isReadOnly': false,
          'authRules': [],
        },
        'status': {
          'name': 'status',
          'type': {'enum': 'Status'},
          'isReadOnly': false,
          'authRules': [],
        },
        'createdAt': {
          'name': 'createdAt',
          'type': {'scalar': 'AWSDateTime'},
          'isReadOnly': true,
          'authRules': [],
        },
        'updatedAt': {
          'name': 'updatedAt',
          'type': {'scalar': 'AWSDateTime'},
          'isReadOnly': true,
          'authRules': [],
        },
      },
      'authRules': [],
      'indexes': [
        {
          'type': 'primary',
          'primaryField': 'id',
          'sortKeyFields': [],
        }
      ],
    },
  )!;

  @override
  String get id;

  /// Query field for the [id] field.
  QueryField<String, SimpleModel, String> get $id => _queryFields.$id;

  /// Query field for the [id] field.
  @Deprecated(r'Use $id instead')
  QueryField<String, SimpleModel, String> get ID => $id;
  @override
  Status? get status;

  /// Query field for the [status] field.
  QueryField<String, SimpleModel, Status?> get $status => _queryFields.$status;

  /// Query field for the [status] field.
  @Deprecated(r'Use $status instead')
  QueryField<String, SimpleModel, Status?> get STATUS => $status;
  @override
  TemporalDateTime get createdAt;
  @override
  TemporalDateTime get updatedAt;

  /// Query field for the [modelIdentifier] field.
  QueryField<String, SimpleModel, String> get $modelIdentifier =>
      _queryFields.$modelIdentifier;

  /// Query field for the [modelIdentifier] field.
  @Deprecated(r'Use $modelIdentifier instead')
  QueryField<String, SimpleModel, String> get MODEL_IDENTIFIER =>
      $modelIdentifier;
  SimpleModel copyWith({
    String? id,
    Status? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return _SimpleModel._(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt:
          createdAt == null ? this.createdAt : TemporalDateTime(createdAt),
      updatedAt:
          updatedAt == null ? this.updatedAt : TemporalDateTime(updatedAt),
    );
  }

  @override
  T valueFor<T extends Object?>(QueryField<String, SimpleModel, T> field) {
    Object? value;
    switch (field.fieldName) {
      case r'id':
        value = id;
        break;
      case r'status':
        value = status;
        break;
      case r'createdAt':
        value = createdAt;
        break;
      case r'updatedAt':
        value = updatedAt;
        break;
    }
    assert(
      value is T,
      'Invalid field ${field.fieldName}: $value (expected $T)',
    );
    return value as T;
  }
}

class _SimpleModel extends SimpleModel {
  _SimpleModel({
    String? id,
    this.status,
  })  : id = id ?? uuid(),
        createdAt = TemporalDateTime.now(),
        updatedAt = TemporalDateTime.now(),
        super._();

  const _SimpleModel._({
    required this.id,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;

  @override
  final Status? status;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;
}

abstract class RemoteSimpleModel extends SimpleModel
    implements RemoteModel<String, SimpleModel> {
  const RemoteSimpleModel._() : super._();
}

class _RemoteSimpleModel extends RemoteSimpleModel {
  const _RemoteSimpleModel({
    required this.id,
    this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.deleted,
    required this.lastChangedAt,
  }) : super._();

  factory _RemoteSimpleModel.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'id',
          ))
        : (json['id'] as String);
    final status = json['status'] == null
        ? null
        : Status.fromJson((json['status'] as String));
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final version = json['_version'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            '_version',
          ))
        : (json['_version'] as int);
    final deleted =
        json['_deleted'] == null ? false : (json['_deleted'] as bool);
    final lastChangedAt = json['_lastChangedAt'] == null
        ? (throw ModelFieldError(
            'SimpleModel',
            '_lastChangedAt',
          ))
        : TemporalDateTime.fromString((json['_lastChangedAt'] as String));
    return _RemoteSimpleModel(
      id: id,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      version: version,
      deleted: deleted,
      lastChangedAt: lastChangedAt,
    );
  }

  @override
  final String id;

  @override
  final Status? status;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final int version;

  @override
  final bool deleted;

  @override
  final TemporalDateTime lastChangedAt;
}