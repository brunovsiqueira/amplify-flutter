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

// Generated with smithy-dart 0.1.0. DO NOT MODIFY.

library amplify_auth_cognito_dart.cognito_identity_provider.model.analytics_metadata_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'analytics_metadata_type.g.dart';

/// An Amazon Pinpoint analytics endpoint.
///
/// An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics. For more information about Amazon Web Services Regions that can contain Amazon Pinpoint resources for use with Amazon Cognito user pools, see [Using Amazon Pinpoint analytics with Amazon Cognito user pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html).
abstract class AnalyticsMetadataType
    with _i1.AWSEquatable<AnalyticsMetadataType>
    implements Built<AnalyticsMetadataType, AnalyticsMetadataTypeBuilder> {
  /// An Amazon Pinpoint analytics endpoint.
  ///
  /// An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics. For more information about Amazon Web Services Regions that can contain Amazon Pinpoint resources for use with Amazon Cognito user pools, see [Using Amazon Pinpoint analytics with Amazon Cognito user pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html).
  factory AnalyticsMetadataType({String? analyticsEndpointId}) {
    return _$AnalyticsMetadataType._(analyticsEndpointId: analyticsEndpointId);
  }

  /// An Amazon Pinpoint analytics endpoint.
  ///
  /// An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics. For more information about Amazon Web Services Regions that can contain Amazon Pinpoint resources for use with Amazon Cognito user pools, see [Using Amazon Pinpoint analytics with Amazon Cognito user pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html).
  factory AnalyticsMetadataType.build(
          [void Function(AnalyticsMetadataTypeBuilder) updates]) =
      _$AnalyticsMetadataType;

  const AnalyticsMetadataType._();

  static const List<_i2.SmithySerializer> serializers = [
    AnalyticsMetadataTypeAwsJson11Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AnalyticsMetadataTypeBuilder b) {}

  /// The endpoint ID.
  String? get analyticsEndpointId;
  @override
  List<Object?> get props => [analyticsEndpointId];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AnalyticsMetadataType');
    helper.add(
      'analyticsEndpointId',
      analyticsEndpointId,
    );
    return helper.toString();
  }
}

class AnalyticsMetadataTypeAwsJson11Serializer
    extends _i2.StructuredSmithySerializer<AnalyticsMetadataType> {
  const AnalyticsMetadataTypeAwsJson11Serializer()
      : super('AnalyticsMetadataType');

  @override
  Iterable<Type> get types => const [
        AnalyticsMetadataType,
        _$AnalyticsMetadataType,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsJson1_1',
        )
      ];
  @override
  AnalyticsMetadataType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalyticsMetadataTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'AnalyticsEndpointId':
          if (value != null) {
            result.analyticsEndpointId = (serializers.deserialize(
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
    final payload = (object as AnalyticsMetadataType);
    final result = <Object?>[];
    if (payload.analyticsEndpointId != null) {
      result
        ..add('AnalyticsEndpointId')
        ..add(serializers.serialize(
          payload.analyticsEndpointId!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}