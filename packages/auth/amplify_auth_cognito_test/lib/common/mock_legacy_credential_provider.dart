// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_auth_cognito_dart/src/credentials/legacy_credential_provider.dart';
import 'package:amplify_auth_cognito_dart/src/state/state.dart';
import 'package:amplify_core/amplify_config.dart';

class MockLegacyCredentialProvider implements LegacyCredentialProvider {
  MockLegacyCredentialProvider({CredentialStoreData? initialData})
      : data = initialData;

  CredentialStoreData? data;

  @override
  Future<void> deleteLegacyCredentials({
    AuthUserPoolConfig? userPoolConfig,
    AuthIdentityPoolConfig? identityPoolConfig,
    AuthHostedUiConfig? hostedUiConfig,
  }) async {
    data = null;
  }

  @override
  Future<CredentialStoreData?> fetchLegacyCredentials({
    AuthUserPoolConfig? userPoolConfig,
    AuthIdentityPoolConfig? identityPoolConfig,
    AuthHostedUiConfig? hostedUiConfig,
  }) async {
    return data;
  }
}
