// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.api_gateway.model.service_unavailable_exception; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i3;
import 'package:smithy/smithy.dart' as _i2;

part 'service_unavailable_exception.g.dart';

/// The requested service is not available. For details see the accompanying error message. Retry after the specified time period.
abstract class ServiceUnavailableException
    with _i1.AWSEquatable<ServiceUnavailableException>
    implements
        Built<ServiceUnavailableException, ServiceUnavailableExceptionBuilder>,
        _i2.HasPayload<ServiceUnavailableExceptionPayload>,
        _i2.SmithyHttpException {
  /// The requested service is not available. For details see the accompanying error message. Retry after the specified time period.
  factory ServiceUnavailableException({
    String? message,
    String? retryAfterSeconds,
  }) {
    return _$ServiceUnavailableException._(
      message: message,
      retryAfterSeconds: retryAfterSeconds,
    );
  }

  /// The requested service is not available. For details see the accompanying error message. Retry after the specified time period.
  factory ServiceUnavailableException.build(
          [void Function(ServiceUnavailableExceptionBuilder) updates]) =
      _$ServiceUnavailableException;

  const ServiceUnavailableException._();

  /// Constructs a [ServiceUnavailableException] from a [payload] and [response].
  factory ServiceUnavailableException.fromResponse(
    ServiceUnavailableExceptionPayload payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      ServiceUnavailableException.build((b) {
        b.message = payload.message;
        if (response.headers['Retry-After'] != null) {
          b.retryAfterSeconds = response.headers['Retry-After']!;
        }
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    ServiceUnavailableExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ServiceUnavailableExceptionBuilder b) {}
  @override
  String? get message;
  String? get retryAfterSeconds;
  @override
  ServiceUnavailableExceptionPayload getPayload() =>
      ServiceUnavailableExceptionPayload((b) {
        b.message = message;
      });
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.apigateway',
        shape: 'ServiceUnavailableException',
      );
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 503;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [
        message,
        retryAfterSeconds,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ServiceUnavailableException');
    helper.add(
      'message',
      message,
    );
    helper.add(
      'retryAfterSeconds',
      retryAfterSeconds,
    );
    return helper.toString();
  }
}

@_i3.internal
abstract class ServiceUnavailableExceptionPayload
    with
        _i1.AWSEquatable<ServiceUnavailableExceptionPayload>
    implements
        Built<ServiceUnavailableExceptionPayload,
            ServiceUnavailableExceptionPayloadBuilder> {
  factory ServiceUnavailableExceptionPayload(
          [void Function(ServiceUnavailableExceptionPayloadBuilder) updates]) =
      _$ServiceUnavailableExceptionPayload;

  const ServiceUnavailableExceptionPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ServiceUnavailableExceptionPayloadBuilder b) {}
  String? get message;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper =
        newBuiltValueToStringHelper('ServiceUnavailableExceptionPayload');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class ServiceUnavailableExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<ServiceUnavailableExceptionPayload> {
  const ServiceUnavailableExceptionRestJson1Serializer()
      : super('ServiceUnavailableException');

  @override
  Iterable<Type> get types => const [
        ServiceUnavailableException,
        _$ServiceUnavailableException,
        ServiceUnavailableExceptionPayload,
        _$ServiceUnavailableExceptionPayload,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ServiceUnavailableExceptionPayload deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServiceUnavailableExceptionPayloadBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'message':
          if (value != null) {
            result.message = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = object is ServiceUnavailableException
        ? object.getPayload()
        : (object as ServiceUnavailableExceptionPayload);
    final result = <Object?>[];
    if (payload.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(
          payload.message!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}