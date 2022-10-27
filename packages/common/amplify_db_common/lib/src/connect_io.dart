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

import 'package:amplify_db_common_dart/src/connect_io.dart' as base;
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// {@macro amplify_db_common.connect}
QueryExecutor connect({
  required String name,
  String? path,
}) {
  return LazyDatabase(() async {
    if (path == null) {
      final filename = '$name.db';
      path = p.join((await getApplicationSupportDirectory()).path, filename);
    }
    return base.connect(name: name, path: path);
  });
}