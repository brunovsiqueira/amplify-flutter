// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.iam.model.policy_role; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'policy_role.g.dart';

/// Contains information about a role that a managed policy is attached to.
///
/// This data type is used as a response element in the ListEntitiesForPolicy operation.
///
/// For more information about managed policies, refer to [Managed policies and inline policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in the _IAM User Guide_.
abstract class PolicyRole
    with _i1.AWSEquatable<PolicyRole>
    implements Built<PolicyRole, PolicyRoleBuilder> {
  /// Contains information about a role that a managed policy is attached to.
  ///
  /// This data type is used as a response element in the ListEntitiesForPolicy operation.
  ///
  /// For more information about managed policies, refer to [Managed policies and inline policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in the _IAM User Guide_.
  factory PolicyRole({
    String? roleName,
    String? roleId,
  }) {
    return _$PolicyRole._(
      roleName: roleName,
      roleId: roleId,
    );
  }

  /// Contains information about a role that a managed policy is attached to.
  ///
  /// This data type is used as a response element in the ListEntitiesForPolicy operation.
  ///
  /// For more information about managed policies, refer to [Managed policies and inline policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in the _IAM User Guide_.
  factory PolicyRole.build([void Function(PolicyRoleBuilder) updates]) =
      _$PolicyRole;

  const PolicyRole._();

  static const List<_i2.SmithySerializer> serializers = [
    PolicyRoleAwsQuerySerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(PolicyRoleBuilder b) {}

  /// The name (friendly name, not ARN) identifying the role.
  String? get roleName;

  /// The stable and unique string identifying the role. For more information about IDs, see [IAM identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the _IAM User Guide_.
  String? get roleId;
  @override
  List<Object?> get props => [
        roleName,
        roleId,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('PolicyRole');
    helper.add(
      'roleName',
      roleName,
    );
    helper.add(
      'roleId',
      roleId,
    );
    return helper.toString();
  }
}

class PolicyRoleAwsQuerySerializer
    extends _i2.StructuredSmithySerializer<PolicyRole> {
  const PolicyRoleAwsQuerySerializer() : super('PolicyRole');

  @override
  Iterable<Type> get types => const [
        PolicyRole,
        _$PolicyRole,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  PolicyRole deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PolicyRoleBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'RoleName':
          if (value != null) {
            result.roleName = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'RoleId':
          if (value != null) {
            result.roleId = (serializers.deserialize(
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
    final payload = (object as PolicyRole);
    final result = <Object?>[
      const _i2.XmlElementName(
        'PolicyRoleResponse',
        _i2.XmlNamespace('https://iam.amazonaws.com/doc/2010-05-08/'),
      )
    ];
    if (payload.roleName != null) {
      result
        ..add(const _i2.XmlElementName('RoleName'))
        ..add(serializers.serialize(
          payload.roleName!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.roleId != null) {
      result
        ..add(const _i2.XmlElementName('RoleId'))
        ..add(serializers.serialize(
          payload.roleId!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}