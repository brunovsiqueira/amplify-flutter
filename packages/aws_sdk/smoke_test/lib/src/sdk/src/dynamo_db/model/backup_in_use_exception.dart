// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.dynamo_db.model.backup_in_use_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'backup_in_use_exception.g.dart';

/// There is another ongoing conflicting backup control plane operation on the table. The backup is either being created, deleted or restored to a table.
abstract class BackupInUseException
    with _i1.AWSEquatable<BackupInUseException>
    implements
        Built<BackupInUseException, BackupInUseExceptionBuilder>,
        _i2.SmithyHttpException {
  /// There is another ongoing conflicting backup control plane operation on the table. The backup is either being created, deleted or restored to a table.
  factory BackupInUseException({String? message}) {
    return _$BackupInUseException._(message: message);
  }

  /// There is another ongoing conflicting backup control plane operation on the table. The backup is either being created, deleted or restored to a table.
  factory BackupInUseException.build(
          [void Function(BackupInUseExceptionBuilder) updates]) =
      _$BackupInUseException;

  const BackupInUseException._();

  /// Constructs a [BackupInUseException] from a [payload] and [response].
  factory BackupInUseException.fromResponse(
    BackupInUseException payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.statusCode = response.statusCode;
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer<BackupInUseException>> serializers = [
    BackupInUseExceptionAwsJson10Serializer()
  ];

  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.dynamodb',
        shape: 'BackupInUseException',
      );
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int? get statusCode;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('BackupInUseException')
      ..add(
        'message',
        message,
      );
    return helper.toString();
  }
}

class BackupInUseExceptionAwsJson10Serializer
    extends _i2.StructuredSmithySerializer<BackupInUseException> {
  const BackupInUseExceptionAwsJson10Serializer()
      : super('BackupInUseException');

  @override
  Iterable<Type> get types => const [
        BackupInUseException,
        _$BackupInUseException,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_0',
        )
      ];
  @override
  BackupInUseException deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BackupInUseExceptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'message':
          result.message = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    BackupInUseException object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final BackupInUseException(:message) = object;
    if (message != null) {
      result$
        ..add('message')
        ..add(serializers.serialize(
          message,
          specifiedType: const FullType(String),
        ));
    }
    return result$;
  }
}
