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

import 'package:amplify_auth_cognito_dart/amplify_auth_cognito_dart.dart'
    hide SignUpRequest, ConfirmSignUpRequest;
import 'package:amplify_auth_cognito_dart/src/model/sign_up_parameters.dart';
import 'package:amplify_auth_cognito_dart/src/sdk/cognito_identity_provider.dart';
import 'package:amplify_core/amplify_core.dart'
    show AWSHttpClient, CancelableOperation;
import 'package:amplify_secure_storage_dart/amplify_secure_storage_dart.dart';
import 'package:mockito/mockito.dart';
import 'package:smithy/smithy.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/test.dart';

import '../common/mock_config.dart';
import '../common/mock_secure_storage.dart';

class MockCognitoIdentityProviderClient extends Fake
    implements CognitoIdentityProviderClient {
  MockCognitoIdentityProviderClient({
    Future<SignUpResponse> Function(SignUpRequest)? signUp,
    Future<ConfirmSignUpResponse> Function(ConfirmSignUpRequest)? confirmSignUp,
  })  : _signUp = signUp,
        _confirmSignUp = confirmSignUp;

  final Future<SignUpResponse> Function(SignUpRequest)? _signUp;
  final Future<ConfirmSignUpResponse> Function(ConfirmSignUpRequest)?
      _confirmSignUp;

  @override
  SmithyOperation<ConfirmSignUpResponse> confirmSignUp(
    ConfirmSignUpRequest input, {
    AWSHttpClient? client,
  }) {
    if (_confirmSignUp == null) {
      throw UnimplementedError();
    }
    return SmithyOperation(
      CancelableOperation.fromFuture(
        Future.value(_confirmSignUp!(input)),
      ),
      operationName: 'ConfirmSignUp',
      requestProgress: const Stream.empty(),
      responseProgress: const Stream.empty(),
    );
  }

  @override
  SmithyOperation<SignUpResponse> signUp(
    SignUpRequest input, {
    AWSHttpClient? client,
  }) {
    if (_signUp == null) {
      throw UnimplementedError();
    }
    return SmithyOperation(
      CancelableOperation.fromFuture(
        Future.value(_signUp!(input)),
      ),
      operationName: 'SignUp',
      requestProgress: const Stream.empty(),
      responseProgress: const Stream.empty(),
    );
  }
}

void main() {
  group('SignUpStateMachine', () {
    late CognitoAuthStateMachine stateMachine;
    late SecureStorageInterface secureStorage;

    const username = 'username';
    const password = 'password';
    final signUpEvent = SignUpEvent.initiate(
      parameters: SignUpParameters(
        (p) => p
          ..username = username
          ..password = password,
      ),
      userAttributes: const {
        'email': 'test@example.com',
      },
      validationData: const {'key': 'value'},
    );

    setUp(() {
      stateMachine = CognitoAuthStateMachine();
      secureStorage = MockSecureStorage();
      stateMachine.addInstance(secureStorage);
    });

    test('success', () async {
      final client = MockCognitoIdentityProviderClient(
        signUp: (input) async => SignUpResponse(
          userSub: userSub,
          userConfirmed: true,
        ),
      );
      stateMachine.dispatch(AuthEvent.configure(mockConfig));
      await stateMachine.stream.whereType<AuthConfigured>().first;

      stateMachine
        ..addInstance<CognitoIdentityProviderClient>(client)
        ..dispatch(signUpEvent);

      expect(
        stateMachine.stream.whereType<SignUpState>(),
        emitsInOrder(<Matcher>[
          isA<SignUpInitiating>(),
          isA<SignUpSuccess>(),
        ]),
      );
    });

    test('needs confirmation', () async {
      final client = MockCognitoIdentityProviderClient(
        signUp: (input) async => SignUpResponse(
          userSub: userSub,
          userConfirmed: false,
        ),
        confirmSignUp: (input) async => ConfirmSignUpResponse(),
      );
      stateMachine.dispatch(AuthEvent.configure(mockConfig));
      await stateMachine.stream.whereType<AuthConfigured>().first;

      stateMachine
        ..addInstance<CognitoIdentityProviderClient>(client)
        ..dispatch(signUpEvent);

      await expectLater(
        stateMachine.stream.whereType<SignUpState>(),
        emitsInOrder(<Matcher>[
          isA<SignUpInitiating>(),
          isA<SignUpNeedsConfirmation>(),
        ]),
      );

      stateMachine.dispatch(
        const SignUpEvent.confirm(
          username: username,
          confirmationCode: '12345',
        ),
      );
      expect(
        stateMachine.stream.whereType<SignUpState>(),
        emitsInOrder(<Matcher>[
          isA<SignUpConfirming>(),
          isA<SignUpSuccess>(),
        ]),
      );
    });

    test('fails, then succeeds', () async {
      var client = MockCognitoIdentityProviderClient(
        signUp: (input) async => throw _SignUpException(),
      );
      stateMachine.dispatch(AuthEvent.configure(mockConfig));
      await stateMachine.stream.whereType<AuthConfigured>().first;

      stateMachine
        ..addInstance<CognitoIdentityProviderClient>(client)
        ..dispatch(signUpEvent);

      await expectLater(
        stateMachine.stream.whereType<SignUpState>(),
        emitsInOrder(<Matcher>[
          isA<SignUpInitiating>(),
          isA<SignUpFailure>().having(
            (state) => state.exception,
            'exception',
            isA<_SignUpException>(),
          ),
        ]),
      );

      client = MockCognitoIdentityProviderClient(
        signUp: (input) async => SignUpResponse(
          userSub: userSub,
          userConfirmed: true,
        ),
      );
      stateMachine
        ..addInstance<CognitoIdentityProviderClient>(client)
        ..dispatch(signUpEvent);

      expect(
        stateMachine.stream.whereType<SignUpState>(),
        emitsInOrder(<Matcher>[
          isA<SignUpInitiating>(),
          isA<SignUpSuccess>(),
        ]),
      );
    });
  });
}

class _SignUpException implements Exception {}
