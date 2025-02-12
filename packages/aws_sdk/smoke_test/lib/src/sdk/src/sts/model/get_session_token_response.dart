// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.sts.model.get_session_token_response; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;
import 'package:smoke_test/src/sdk/src/sts/model/credentials.dart';

part 'get_session_token_response.g.dart';

/// Contains the response to a successful GetSessionToken request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests.
abstract class GetSessionTokenResponse
    with _i1.AWSEquatable<GetSessionTokenResponse>
    implements Built<GetSessionTokenResponse, GetSessionTokenResponseBuilder> {
  /// Contains the response to a successful GetSessionToken request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests.
  factory GetSessionTokenResponse({Credentials? credentials}) {
    return _$GetSessionTokenResponse._(credentials: credentials);
  }

  /// Contains the response to a successful GetSessionToken request, including temporary Amazon Web Services credentials that can be used to make Amazon Web Services requests.
  factory GetSessionTokenResponse.build(
          [void Function(GetSessionTokenResponseBuilder) updates]) =
      _$GetSessionTokenResponse;

  const GetSessionTokenResponse._();

  /// Constructs a [GetSessionTokenResponse] from a [payload] and [response].
  factory GetSessionTokenResponse.fromResponse(
    GetSessionTokenResponse payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload;

  static const List<_i2.SmithySerializer<GetSessionTokenResponse>> serializers =
      [GetSessionTokenResponseAwsQuerySerializer()];

  /// The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.
  ///
  /// The size of the security token that STS API operations return is not fixed. We strongly recommend that you make no assumptions about the maximum size.
  Credentials? get credentials;
  @override
  List<Object?> get props => [credentials];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('GetSessionTokenResponse')
      ..add(
        'credentials',
        credentials,
      );
    return helper.toString();
  }
}

class GetSessionTokenResponseAwsQuerySerializer
    extends _i2.StructuredSmithySerializer<GetSessionTokenResponse> {
  const GetSessionTokenResponseAwsQuerySerializer()
      : super('GetSessionTokenResponse');

  @override
  Iterable<Type> get types => const [
        GetSessionTokenResponse,
        _$GetSessionTokenResponse,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  GetSessionTokenResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetSessionTokenResponseBuilder();
    final responseIterator = serialized.iterator;
    while (responseIterator.moveNext()) {
      final key = responseIterator.current as String;
      responseIterator.moveNext();
      if (key.endsWith('Result')) {
        serialized = responseIterator.current as Iterable;
      }
    }
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'Credentials':
          result.credentials.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(Credentials),
          ) as Credentials));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GetSessionTokenResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[
      const _i2.XmlElementName(
        'GetSessionTokenResponseResponse',
        _i2.XmlNamespace('https://sts.amazonaws.com/doc/2011-06-15/'),
      )
    ];
    final GetSessionTokenResponse(:credentials) = object;
    if (credentials != null) {
      result$
        ..add(const _i2.XmlElementName('Credentials'))
        ..add(serializers.serialize(
          credentials,
          specifiedType: const FullType(Credentials),
        ));
    }
    return result$;
  }
}
