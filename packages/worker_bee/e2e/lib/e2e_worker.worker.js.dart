// Generated by worker_bee_builder.

import 'package:aws_common/aws_common.dart';
import 'package:e2e/e2e_worker.dart';

/// The JS implementation of [E2EWorker].
class E2EWorkerImpl extends E2EWorker {
  @override
  String get name => 'E2EWorker';
  @override
  List<String> get fallbackUrls {
    // When running in a test, we need to find the `packages` directory which
    // is symlinked in the root `test/` directory.
    final baseUri = Uri.base;
    final basePath = baseUri.pathSegments
        .takeWhile((segment) => segment != 'test')
        .map(Uri.encodeComponent)
        .join('/');
    const relativePath = zDebugMode
        ? 'packages/e2e/workers.debug.dart.js'
        : 'packages/e2e/workers.release.dart.js';
    final testRelativePath = Uri(
      scheme: baseUri.scheme,
      host: baseUri.host,
      port: baseUri.port,
      path: '$basePath/test/$relativePath',
    ).toString();
    return [
      relativePath,
      testRelativePath,
    ];
  }
}
