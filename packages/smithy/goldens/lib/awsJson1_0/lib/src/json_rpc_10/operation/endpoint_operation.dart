// Generated with smithy-dart 0.1.1. DO NOT MODIFY.

library aws_json1_0_v1.json_rpc_10.operation.endpoint_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i6;

import 'package:aws_common/aws_common.dart' as _i5;
import 'package:aws_json1_0_v1/src/json_rpc_10/common/endpoint_resolver.dart'
    as _i4;
import 'package:aws_json1_0_v1/src/json_rpc_10/common/serializers.dart' as _i3;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i2;

class EndpointOperation
    extends _i1.HttpOperation<_i1.Unit, _i1.Unit, _i1.Unit, _i1.Unit> {
  EndpointOperation({
    required String region,
    Uri? baseUri,
  })  : _region = region,
        _baseUri = baseUri;

  @override
  late final List<_i1.HttpProtocol<_i1.Unit, _i1.Unit, _i1.Unit, _i1.Unit>>
      protocols = [
    _i2.AwsJson1_0Protocol(
      serializers: _i3.serializers,
      builderFactories: _i3.builderFactories,
      requestInterceptors: [
        const _i1.WithHost(),
        const _i1.WithHeader(
          'X-Amz-Target',
          'JsonRpc10.EndpointOperation',
        ),
        const _i1.WithUserAgent('aws-sdk-dart/0.1.1'),
        const _i2.WithSdkInvocationId(),
        const _i2.WithSdkRequest(),
      ],
      responseInterceptors: [],
    )
  ];

  late final _i2.AWSEndpoint _awsEndpoint = _i4.endpointResolver.resolve(
    _i4.sdkId,
    _region,
  );

  final String _region;

  final Uri? _baseUri;

  @override
  _i1.HttpRequest buildRequest(_i1.Unit input) => _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/';
        b.hostPrefix = 'foo.';
      });
  @override
  int successCode([_i1.Unit? output]) => 200;
  @override
  _i1.Unit buildOutput(
    _i1.Unit payload,
    _i5.AWSBaseHttpResponse response,
  ) =>
      payload;
  @override
  List<_i1.SmithyError> get errorTypes => const [];
  @override
  String get runtimeTypeName => 'EndpointOperation';
  @override
  _i2.AWSRetryer get retryer => _i2.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i1.SmithyOperation<_i1.Unit> run(
    _i1.Unit input, {
    _i5.AWSHttpClient? client,
    _i1.ShapeId? useProtocol,
  }) {
    return _i6.runZoned(
      () => super.run(
        input,
        client: client,
        useProtocol: useProtocol,
      ),
      zoneValues: {
        ...?_awsEndpoint.credentialScope?.zoneValues,
        ...{_i5.AWSHeaders.sdkInvocationId: _i5.uuid(secure: true)}
      },
    );
  }
}
