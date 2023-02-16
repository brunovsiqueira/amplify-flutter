import 'package:amplify_core/amplify_core.dart';

abstract class ServiceProviderClient {
  Future<void> init({
    AmplifyConfig? config,
    required AmplifyAuthProviderRepository authProviderRepo,
  }) async {}

  Future<void> registerDevice(String deviceToken) async {}
  Future<void> recordNotificationEvent({
    required AnalyticsEvent event,
  }) async {}
}