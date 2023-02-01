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

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: non_constant_identifier_names,inference_failure_on_collection_literal

library models.blog;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

import 'post.dart';
import 'user.dart';

class BlogType extends ModelType<String, Blog, PartialBlog> {
  const BlogType();

  @override
  T fromJson<T extends PartialModel<String, Blog>>(Map<String, Object?> json) {
    if (T == Blog || T == Model<String, Blog>) {
      return Blog.fromJson(json) as T;
    }
    if (T == RemoteBlog || T == RemoteModel<String, Blog>) {
      return _RemoteBlog.fromJson(json) as T;
    }
    return _PartialBlog.fromJson(json) as T;
  }

  @override
  String get modelName => 'Blog';
}

class BlogQueryFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const BlogQueryFields([this._root]);

  final QueryField<ModelIdentifier, M, Blog>? _root;

  /// Query field for the [Blog.id] field.
  QueryField<ModelIdentifier, M, String> get $id =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'id'),
        root: _root,
      );

  /// Query field for the [Blog.name] field.
  QueryField<ModelIdentifier, M, String> get $name =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'name'),
        root: _root,
      );

  /// Query field for the [Blog.posts] field.
  PostQueryFields<ModelIdentifier, M> get $posts => PostQueryFields(
        NestedQueryField<ModelIdentifier, M, String, Blog, Post>(
          const QueryField<String, Blog, Post>(fieldName: 'posts'),
          root: _root,
        ),
      );

  /// Query field for the [Blog.author] field.
  UserQueryFields<ModelIdentifier, M> get $author => UserQueryFields(
        NestedQueryField<ModelIdentifier, M, String, Blog, User>(
          const QueryField<String, Blog, User>(fieldName: 'author'),
          root: _root,
        ),
      );

  /// Query field for the [Blog.createdAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $createdAt =>
      NestedQueryField<ModelIdentifier, M, String, Blog, TemporalDateTime>(
        const QueryField<String, Blog, TemporalDateTime>(
          fieldName: 'createdAt',
        ),
        root: _root,
      );

  /// Query field for the [Blog.updatedAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $updatedAt =>
      NestedQueryField<ModelIdentifier, M, String, Blog, TemporalDateTime>(
        const QueryField<String, Blog, TemporalDateTime>(
          fieldName: 'updatedAt',
        ),
        root: _root,
      );

  /// Query field for the [Blog.blogAuthorUserId] field.
  QueryField<ModelIdentifier, M, String?> get $blogAuthorUserId =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String?>(
        const QueryField<String, Blog, String?>(fieldName: 'blogAuthorUserId'),
        root: _root,
      );

  /// Query field for the [Blog.blogAuthorUsername] field.
  QueryField<ModelIdentifier, M, String?> get $blogAuthorUsername =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String?>(
        const QueryField<String, Blog, String?>(
          fieldName: 'blogAuthorUsername',
        ),
        root: _root,
      );

  /// Query field for the [Blog] model identifier.
  QueryField<ModelIdentifier, M, String> get $modelIdentifier =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'modelIdentifier'),
        root: _root,
      );
}

abstract class PartialBlog extends PartialModel<String, Blog>
    with AWSEquatable<PartialBlog> {
  const PartialBlog._();

  String get id;
  String? get name;
  AsyncModelCollection<String, Post, PartialPost, PartialPost>? get posts;
  PartialUser? get author;
  TemporalDateTime? get createdAt;
  TemporalDateTime? get updatedAt;
  String? get blogAuthorUserId;
  String? get blogAuthorUsername;
  @override
  String get modelIdentifier => id;
  @override
  BlogType get modelType => Blog.classType;
  @override
  List<Object?> get props => [
        id,
        name,
        posts,
        author,
        createdAt,
        updatedAt,
        blogAuthorUserId,
        blogAuthorUsername,
      ];
  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': name,
        'posts': posts?.toJson(),
        'author': author?.toJson(),
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
        'blogAuthorUserId': blogAuthorUserId,
        'blogAuthorUsername': blogAuthorUsername,
        '_version': version,
        '_deleted': deleted,
        '_lastChangedAt': lastChangedAt?.format(),
      };
  @override
  String get runtimeTypeName => 'Blog';
}

class _PartialBlog extends PartialBlog {
  const _PartialBlog({
    required this.id,
    this.name,
    this.posts,
    this.author,
    this.createdAt,
    this.updatedAt,
    this.blogAuthorUserId,
    this.blogAuthorUsername,
  }) : super._();

  factory _PartialBlog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null ? null : (json['name'] as String);
    final createdAt = json['createdAt'] == null
        ? null
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? null
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogAuthorUserId = json['blogAuthorUserId'] == null
        ? null
        : (json['blogAuthorUserId'] as String);
    final blogAuthorUsername = json['blogAuthorUsername'] == null
        ? null
        : (json['blogAuthorUsername'] as String);
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, PartialPost>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map(
                  (el) => el == null
                      ? null
                      : Post.classType.fromJson<PartialPost>(el),
                )
                .whereType<PartialPost>()
                .toList(),
          );
    final author = json['author'] == null
        ? null
        : User.classType
            .fromJson<PartialUser>((json['author'] as Map<String, Object?>));
    return _PartialBlog(
      id: id,
      name: name,
      posts: posts,
      author: author,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogAuthorUserId: blogAuthorUserId,
      blogAuthorUsername: blogAuthorUsername,
    );
  }

  @override
  final String id;

  @override
  final String? name;

  @override
  final AsyncModelCollection<String, Post, PartialPost, PartialPost>? posts;

  @override
  final PartialUser? author;

  @override
  final TemporalDateTime? createdAt;

  @override
  final TemporalDateTime? updatedAt;

  @override
  final String? blogAuthorUserId;

  @override
  final String? blogAuthorUsername;
}

abstract class Blog extends PartialBlog
    with LegacyModelFields<String, Blog>
    implements Model<String, Blog> {
  factory Blog({
    String? id,
    required String name,
    List<Post>? posts,
    User? author,
  }) = _Blog;

  const Blog._() : super._();

  factory Blog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null
        ? (throw ModelFieldError(
            'Blog',
            'name',
          ))
        : (json['name'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogAuthorUserId = json['blogAuthorUserId'] == null
        ? null
        : (json['blogAuthorUserId'] as String);
    final blogAuthorUsername = json['blogAuthorUsername'] == null
        ? null
        : (json['blogAuthorUsername'] as String);
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, Post>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map((el) =>
                    el == null ? null : Post.classType.fromJson<Post>(el))
                .whereType<Post>()
                .toList(),
          );
    final author = json['author'] == null
        ? null
        : User.classType
            .fromJson<User>((json['author'] as Map<String, Object?>));
    return _Blog._(
      id: id,
      name: name,
      posts: posts,
      author: author,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogAuthorUserId: blogAuthorUserId,
      blogAuthorUsername: blogAuthorUsername,
    );
  }

  static const BlogType classType = BlogType();

  static const BlogQueryFields<String, Blog> _queryFields = BlogQueryFields();

  static final mipr.ModelTypeDefinition schema =
      mipr.serializers.deserializeWith(
    mipr.ModelTypeDefinition.serializer,
    const {
      'name': 'Blog',
      'pluralName': 'Blogs',
      'fields': {
        'id': {
          'name': 'id',
          'type': {'scalar': 'ID'},
          'isReadOnly': false,
          'authRules': [],
        },
        'name': {
          'name': 'name',
          'type': {'scalar': 'String'},
          'isReadOnly': false,
          'authRules': [],
        },
        'posts': {
          'name': 'posts',
          'type': {
            'list': {'model': 'Post'}
          },
          'isReadOnly': false,
          'authRules': [],
          'association': {
            'associationType': 'HasMany',
            'associatedType': 'Post',
            'associatedFields': ['blog'],
          },
        },
        'author': {
          'name': 'author',
          'type': {'model': 'User'},
          'isReadOnly': false,
          'authRules': [],
          'association': {
            'associationType': 'BelongsTo',
            'associatedType': 'User',
            'targetNames': [
              'blogAuthorUserId',
              'blogAuthorUsername',
            ],
          },
        },
        'createdAt': {
          'name': 'createdAt',
          'type': {'scalar': 'AWSDateTime'},
          'isReadOnly': true,
          'authRules': [],
        },
        'updatedAt': {
          'name': 'updatedAt',
          'type': {'scalar': 'AWSDateTime'},
          'isReadOnly': true,
          'authRules': [],
        },
        'blogAuthorUserId': {
          'name': 'blogAuthorUserId',
          'type': {'scalar': 'ID'},
          'isReadOnly': true,
          'authRules': [],
        },
        'blogAuthorUsername': {
          'name': 'blogAuthorUsername',
          'type': {'scalar': 'String'},
          'isReadOnly': true,
          'authRules': [],
        },
      },
      'authRules': [],
      'indexes': [
        {
          'type': 'primary',
          'primaryField': 'id',
          'sortKeyFields': [],
        },
        {
          'type': 'foreign',
          'primaryField': 'author',
          'sortKeyFields': [
            'blogAuthorUserId',
            'blogAuthorUsername',
          ],
          'name': 'author',
        },
      ],
    },
  )!;

  @override
  String get id;

  /// Query field for the [id] field.
  static QueryField<String, Blog, String> get $id => _queryFields.$id;

  /// Query field for the [id] field.
  @Deprecated(r'Use $id instead')
  static QueryField<String, Blog, String> get ID => $id;
  @override
  String get name;

  /// Query field for the [name] field.
  static QueryField<String, Blog, String> get $name => _queryFields.$name;

  /// Query field for the [name] field.
  @Deprecated(r'Use $name instead')
  static QueryField<String, Blog, String> get NAME => $name;
  @override
  AsyncModelCollection<String, Post, PartialPost, Post>? get posts;

  /// Query field for the [posts] field.
  static PostQueryFields<String, Blog> get $posts => _queryFields.$posts;

  /// Query field for the [posts] field.
  @Deprecated(r'Use $posts instead')
  static PostQueryFields<String, Blog> get POSTS => $posts;
  @override
  User? get author;

  /// Query field for the [author] field.
  static UserQueryFields<String, Blog> get $author => _queryFields.$author;

  /// Query field for the [author] field.
  @Deprecated(r'Use $author instead')
  static UserQueryFields<String, Blog> get AUTHOR => $author;
  @override
  TemporalDateTime get createdAt;
  @override
  TemporalDateTime get updatedAt;
  @override
  String? get blogAuthorUserId;
  @override
  String? get blogAuthorUsername;

  /// Query field for the [modelIdentifier] field.
  static QueryField<String, Blog, String> get $modelIdentifier =>
      _queryFields.$modelIdentifier;

  /// Query field for the [modelIdentifier] field.
  @Deprecated(r'Use $modelIdentifier instead')
  static QueryField<String, Blog, String> get MODEL_IDENTIFIER =>
      $modelIdentifier;
  Blog copyWith({
    String? id,
    String? name,
    List<Post>? posts,
    User? author,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? blogAuthorUserId,
    String? blogAuthorUsername,
  }) {
    return _Blog._(
      id: id ?? this.id,
      name: name ?? this.name,
      posts: posts == null ? this.posts : AsyncModelCollection.fromList(posts),
      author: author ?? this.author,
      createdAt:
          createdAt == null ? this.createdAt : TemporalDateTime(createdAt),
      updatedAt:
          updatedAt == null ? this.updatedAt : TemporalDateTime(updatedAt),
      blogAuthorUserId: blogAuthorUserId ?? this.blogAuthorUserId,
      blogAuthorUsername: blogAuthorUsername ?? this.blogAuthorUsername,
    );
  }

  @override
  T valueFor<T extends Object?>(QueryField<String, Blog, T> field) {
    Object? value;
    switch (field.fieldName) {
      case r'id':
        value = id;
        break;
      case r'name':
        value = name;
        break;
      case r'posts':
        value = posts;
        break;
      case r'author':
        value = author;
        break;
      case r'createdAt':
        value = createdAt;
        break;
      case r'updatedAt':
        value = updatedAt;
        break;
      case r'blogAuthorUserId':
        value = blogAuthorUserId;
        break;
      case r'blogAuthorUsername':
        value = blogAuthorUsername;
        break;
    }
    assert(
      value is T,
      'Invalid field ${field.fieldName}: $value (expected $T)',
    );
    return value as T;
  }
}

class _Blog extends Blog {
  _Blog({
    String? id,
    required this.name,
    List<Post>? posts,
    this.author,
  })  : id = id ?? uuid(),
        posts = posts == null ? null : AsyncModelCollection.fromList(posts),
        createdAt = TemporalDateTime.now(),
        updatedAt = TemporalDateTime.now(),
        blogAuthorUserId = author?.userId,
        blogAuthorUsername = author?.username,
        super._();

  const _Blog._({
    required this.id,
    required this.name,
    this.posts,
    this.author,
    required this.createdAt,
    required this.updatedAt,
    this.blogAuthorUserId,
    this.blogAuthorUsername,
  }) : super._();

  @override
  final String id;

  @override
  final String name;

  @override
  final AsyncModelCollection<String, Post, PartialPost, Post>? posts;

  @override
  final User? author;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final String? blogAuthorUserId;

  @override
  final String? blogAuthorUsername;
}

abstract class RemoteBlog extends Blog implements RemoteModel<String, Blog> {
  const RemoteBlog._() : super._();
}

class _RemoteBlog extends RemoteBlog {
  const _RemoteBlog({
    required this.id,
    required this.name,
    this.posts,
    this.author,
    required this.createdAt,
    required this.updatedAt,
    this.blogAuthorUserId,
    this.blogAuthorUsername,
    required this.version,
    required this.deleted,
    required this.lastChangedAt,
  }) : super._();

  factory _RemoteBlog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null
        ? (throw ModelFieldError(
            'Blog',
            'name',
          ))
        : (json['name'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogAuthorUserId = json['blogAuthorUserId'] == null
        ? null
        : (json['blogAuthorUserId'] as String);
    final blogAuthorUsername = json['blogAuthorUsername'] == null
        ? null
        : (json['blogAuthorUsername'] as String);
    final version = json['_version'] == null
        ? (throw ModelFieldError(
            'Blog',
            '_version',
          ))
        : (json['_version'] as int);
    final deleted =
        json['_deleted'] == null ? false : (json['_deleted'] as bool);
    final lastChangedAt = json['_lastChangedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            '_lastChangedAt',
          ))
        : TemporalDateTime.fromString((json['_lastChangedAt'] as String));
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, RemotePost>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map(
                  (el) => el == null
                      ? null
                      : Post.classType.fromJson<RemotePost>(el),
                )
                .whereType<RemotePost>()
                .toList(),
          );
    final author = json['author'] == null
        ? null
        : User.classType
            .fromJson<RemoteUser>((json['author'] as Map<String, Object?>));
    return _RemoteBlog(
      id: id,
      name: name,
      posts: posts,
      author: author,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogAuthorUserId: blogAuthorUserId,
      blogAuthorUsername: blogAuthorUsername,
      version: version,
      deleted: deleted,
      lastChangedAt: lastChangedAt,
    );
  }

  @override
  final String id;

  @override
  final String name;

  @override
  final AsyncModelCollection<String, Post, PartialPost, Post>? posts;

  @override
  final RemoteUser? author;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final String? blogAuthorUserId;

  @override
  final String? blogAuthorUsername;

  @override
  final int version;

  @override
  final bool deleted;

  @override
  final TemporalDateTime lastChangedAt;
}