// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.iam.operation.create_service_specific_credential_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i5;

import 'package:aws_common/aws_common.dart' as _i4;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i2;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i3;
import 'package:smoke_test/src/sdk/src/iam/common/endpoint_resolver.dart';
import 'package:smoke_test/src/sdk/src/iam/common/serializers.dart';
import 'package:smoke_test/src/sdk/src/iam/model/create_service_specific_credential_request.dart';
import 'package:smoke_test/src/sdk/src/iam/model/create_service_specific_credential_response.dart';
import 'package:smoke_test/src/sdk/src/iam/model/limit_exceeded_exception.dart';
import 'package:smoke_test/src/sdk/src/iam/model/no_such_entity_exception.dart';
import 'package:smoke_test/src/sdk/src/iam/model/service_not_supported_exception.dart';

/// Generates a set of credentials consisting of a user name and password that can be used to access the service specified in the request. These credentials are generated by IAM, and can be used only for the specified service.
///
/// You can have a maximum of two sets of service-specific credentials for each supported service per user.
///
/// You can create service-specific credentials for CodeCommit and Amazon Keyspaces (for Apache Cassandra).
///
/// You can reset the password to a new service-generated value by calling ResetServiceSpecificCredential.
///
/// For more information about service-specific credentials, see [Using IAM with CodeCommit: Git credentials, SSH keys, and Amazon Web Services access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html) in the _IAM User Guide_.
class CreateServiceSpecificCredentialOperation extends _i1.HttpOperation<
    CreateServiceSpecificCredentialRequest,
    CreateServiceSpecificCredentialRequest,
    CreateServiceSpecificCredentialResponse,
    CreateServiceSpecificCredentialResponse> {
  /// Generates a set of credentials consisting of a user name and password that can be used to access the service specified in the request. These credentials are generated by IAM, and can be used only for the specified service.
  ///
  /// You can have a maximum of two sets of service-specific credentials for each supported service per user.
  ///
  /// You can create service-specific credentials for CodeCommit and Amazon Keyspaces (for Apache Cassandra).
  ///
  /// You can reset the password to a new service-generated value by calling ResetServiceSpecificCredential.
  ///
  /// For more information about service-specific credentials, see [Using IAM with CodeCommit: Git credentials, SSH keys, and Amazon Web Services access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html) in the _IAM User Guide_.
  CreateServiceSpecificCredentialOperation({
    required String region,
    Uri? baseUri,
    _i2.AWSCredentialsProvider credentialsProvider =
        const _i2.AWSCredentialsProvider.defaultChain(),
    List<_i1.HttpRequestInterceptor> requestInterceptors = const [],
    List<_i1.HttpResponseInterceptor> responseInterceptors = const [],
  })  : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider,
        _requestInterceptors = requestInterceptors,
        _responseInterceptors = responseInterceptors;

  @override
  late final List<
      _i1.HttpProtocol<
          CreateServiceSpecificCredentialRequest,
          CreateServiceSpecificCredentialRequest,
          CreateServiceSpecificCredentialResponse,
          CreateServiceSpecificCredentialResponse>> protocols = [
    _i3.AwsQueryProtocol(
      serializers: serializers,
      builderFactories: builderFactories,
      requestInterceptors: <_i1.HttpRequestInterceptor>[
            const _i1.WithHost(),
            const _i1.WithContentLength(),
            _i3.WithSigV4(
              region: _region,
              service: _i4.AWSService.iam,
              credentialsProvider: _credentialsProvider,
            ),
            const _i1.WithUserAgent('aws-sdk-dart/0.3.1'),
            const _i3.WithSdkInvocationId(),
            const _i3.WithSdkRequest(),
          ] +
          _requestInterceptors,
      responseInterceptors:
          <_i1.HttpResponseInterceptor>[] + _responseInterceptors,
      action: 'CreateServiceSpecificCredential',
      version: '2010-05-08',
      awsQueryErrors: const [
        _i3.AwsQueryError(
          shape: 'LimitExceededException',
          code: 'LimitExceeded',
          httpResponseCode: 409,
        ),
        _i3.AwsQueryError(
          shape: 'NoSuchEntityException',
          code: 'NoSuchEntity',
          httpResponseCode: 404,
        ),
        _i3.AwsQueryError(
          shape: 'ServiceNotSupportedException',
          code: 'NotSupportedService',
          httpResponseCode: 404,
        ),
      ],
    )
  ];

  late final _i3.AWSEndpoint _awsEndpoint = endpointResolver.resolve(
    sdkId,
    _region,
  );

  final String _region;

  final Uri? _baseUri;

  final _i2.AWSCredentialsProvider _credentialsProvider;

  final List<_i1.HttpRequestInterceptor> _requestInterceptors;

  final List<_i1.HttpResponseInterceptor> _responseInterceptors;

  @override
  _i1.HttpRequest buildRequest(CreateServiceSpecificCredentialRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/';
      });
  @override
  int successCode([CreateServiceSpecificCredentialResponse? output]) => 200;
  @override
  CreateServiceSpecificCredentialResponse buildOutput(
    CreateServiceSpecificCredentialResponse payload,
    _i4.AWSBaseHttpResponse response,
  ) =>
      CreateServiceSpecificCredentialResponse.fromResponse(
        payload,
        response,
      );
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError<LimitExceededException, LimitExceededException>(
          _i1.ShapeId(
            namespace: 'com.amazonaws.iam',
            shape: 'LimitExceededException',
          ),
          _i1.ErrorKind.client,
          LimitExceededException,
          statusCode: 409,
          builder: LimitExceededException.fromResponse,
        ),
        _i1.SmithyError<NoSuchEntityException, NoSuchEntityException>(
          _i1.ShapeId(
            namespace: 'com.amazonaws.iam',
            shape: 'NoSuchEntityException',
          ),
          _i1.ErrorKind.client,
          NoSuchEntityException,
          statusCode: 404,
          builder: NoSuchEntityException.fromResponse,
        ),
        _i1.SmithyError<ServiceNotSupportedException,
            ServiceNotSupportedException>(
          _i1.ShapeId(
            namespace: 'com.amazonaws.iam',
            shape: 'ServiceNotSupportedException',
          ),
          _i1.ErrorKind.client,
          ServiceNotSupportedException,
          statusCode: 404,
          builder: ServiceNotSupportedException.fromResponse,
        ),
      ];
  @override
  String get runtimeTypeName => 'CreateServiceSpecificCredential';
  @override
  _i3.AWSRetryer get retryer => _i3.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i1.SmithyOperation<CreateServiceSpecificCredentialResponse> run(
    CreateServiceSpecificCredentialRequest input, {
    _i4.AWSHttpClient? client,
    _i1.ShapeId? useProtocol,
  }) {
    return _i5.runZoned(
      () => super.run(
        input,
        client: client,
        useProtocol: useProtocol,
      ),
      zoneValues: {
        ...?_awsEndpoint.credentialScope?.zoneValues,
        ...{_i4.AWSHeaders.sdkInvocationId: _i4.uuid(secure: true)},
      },
    );
  }
}
