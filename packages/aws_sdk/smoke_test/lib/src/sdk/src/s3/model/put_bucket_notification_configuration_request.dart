// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.s3.model.put_bucket_notification_configuration_request; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;
import 'package:smoke_test/src/sdk/src/s3/model/event_bridge_configuration.dart';
import 'package:smoke_test/src/sdk/src/s3/model/lambda_function_configuration.dart';
import 'package:smoke_test/src/sdk/src/s3/model/notification_configuration.dart';
import 'package:smoke_test/src/sdk/src/s3/model/queue_configuration.dart';
import 'package:smoke_test/src/sdk/src/s3/model/topic_configuration.dart';

part 'put_bucket_notification_configuration_request.g.dart';

abstract class PutBucketNotificationConfigurationRequest
    with
        _i1.HttpInput<NotificationConfiguration>,
        _i2.AWSEquatable<PutBucketNotificationConfigurationRequest>
    implements
        Built<PutBucketNotificationConfigurationRequest,
            PutBucketNotificationConfigurationRequestBuilder>,
        _i1.HasPayload<NotificationConfiguration> {
  factory PutBucketNotificationConfigurationRequest({
    required String bucket,
    required NotificationConfiguration notificationConfiguration,
    String? expectedBucketOwner,
    bool? skipDestinationValidation,
  }) {
    return _$PutBucketNotificationConfigurationRequest._(
      bucket: bucket,
      notificationConfiguration: notificationConfiguration,
      expectedBucketOwner: expectedBucketOwner,
      skipDestinationValidation: skipDestinationValidation,
    );
  }

  factory PutBucketNotificationConfigurationRequest.build(
      [void Function(PutBucketNotificationConfigurationRequestBuilder)
          updates]) = _$PutBucketNotificationConfigurationRequest;

  const PutBucketNotificationConfigurationRequest._();

  factory PutBucketNotificationConfigurationRequest.fromRequest(
    NotificationConfiguration payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      PutBucketNotificationConfigurationRequest.build((b) {
        b.notificationConfiguration.replace(payload);
        if (request.headers['x-amz-expected-bucket-owner'] != null) {
          b.expectedBucketOwner =
              request.headers['x-amz-expected-bucket-owner']!;
        }
        if (request.headers['x-amz-skip-destination-validation'] != null) {
          b.skipDestinationValidation =
              request.headers['x-amz-skip-destination-validation']! == 'true';
        }
        if (labels['bucket'] != null) {
          b.bucket = labels['bucket']!;
        }
      });

  static const List<_i1.SmithySerializer<NotificationConfiguration>>
      serializers = [
    PutBucketNotificationConfigurationRequestRestXmlSerializer()
  ];

  /// The name of the bucket.
  String get bucket;

  /// A container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off for the bucket.
  NotificationConfiguration get notificationConfiguration;

  /// The account ID of the expected bucket owner. If the bucket is owned by a different account, the request fails with the HTTP status code `403 Forbidden` (access denied).
  String? get expectedBucketOwner;

  /// Skips validation of Amazon SQS, Amazon SNS, and Lambda destinations. True or false value.
  bool? get skipDestinationValidation;
  @override
  String labelFor(String key) {
    switch (key) {
      case 'Bucket':
        return bucket;
    }
    throw _i1.MissingLabelException(
      this,
      key,
    );
  }

  @override
  NotificationConfiguration getPayload() => notificationConfiguration;
  @override
  List<Object?> get props => [
        bucket,
        notificationConfiguration,
        expectedBucketOwner,
        skipDestinationValidation,
      ];
  @override
  String toString() {
    final helper =
        newBuiltValueToStringHelper('PutBucketNotificationConfigurationRequest')
          ..add(
            'bucket',
            bucket,
          )
          ..add(
            'notificationConfiguration',
            notificationConfiguration,
          )
          ..add(
            'expectedBucketOwner',
            expectedBucketOwner,
          )
          ..add(
            'skipDestinationValidation',
            skipDestinationValidation,
          );
    return helper.toString();
  }
}

class PutBucketNotificationConfigurationRequestRestXmlSerializer
    extends _i1.StructuredSmithySerializer<NotificationConfiguration> {
  const PutBucketNotificationConfigurationRequestRestXmlSerializer()
      : super('PutBucketNotificationConfigurationRequest');

  @override
  Iterable<Type> get types => const [
        PutBucketNotificationConfigurationRequest,
        _$PutBucketNotificationConfigurationRequest,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restXml',
        )
      ];
  @override
  NotificationConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationConfigurationBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'TopicConfiguration':
          result.topicConfigurations.add((serializers.deserialize(
            value,
            specifiedType: const FullType(TopicConfiguration),
          ) as TopicConfiguration));
        case 'QueueConfiguration':
          result.queueConfigurations.add((serializers.deserialize(
            value,
            specifiedType: const FullType(QueueConfiguration),
          ) as QueueConfiguration));
        case 'CloudFunctionConfiguration':
          result.lambdaFunctionConfigurations.add((serializers.deserialize(
            value,
            specifiedType: const FullType(LambdaFunctionConfiguration),
          ) as LambdaFunctionConfiguration));
        case 'EventBridgeConfiguration':
          result.eventBridgeConfiguration.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(EventBridgeConfiguration),
          ) as EventBridgeConfiguration));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    NotificationConfiguration object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[
      const _i1.XmlElementName(
        'NotificationConfiguration',
        _i1.XmlNamespace('http://s3.amazonaws.com/doc/2006-03-01/'),
      )
    ];
    final NotificationConfiguration(
      :topicConfigurations,
      :queueConfigurations,
      :lambdaFunctionConfigurations,
      :eventBridgeConfiguration
    ) = object;
    if (topicConfigurations != null) {
      result$.addAll(
          const _i1.XmlBuiltListSerializer(memberName: 'TopicConfiguration')
              .serialize(
        serializers,
        topicConfigurations,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(TopicConfiguration)],
        ),
      ));
    }
    if (queueConfigurations != null) {
      result$.addAll(
          const _i1.XmlBuiltListSerializer(memberName: 'QueueConfiguration')
              .serialize(
        serializers,
        queueConfigurations,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(QueueConfiguration)],
        ),
      ));
    }
    if (lambdaFunctionConfigurations != null) {
      result$.addAll(const _i1.XmlBuiltListSerializer(
              memberName: 'CloudFunctionConfiguration')
          .serialize(
        serializers,
        lambdaFunctionConfigurations,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(LambdaFunctionConfiguration)],
        ),
      ));
    }
    if (eventBridgeConfiguration != null) {
      result$
        ..add(const _i1.XmlElementName('EventBridgeConfiguration'))
        ..add(serializers.serialize(
          eventBridgeConfiguration,
          specifiedType: const FullType(EventBridgeConfiguration),
        ));
    }
    return result$;
  }
}
