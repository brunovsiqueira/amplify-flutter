// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.cloud_formation.model.stack_instance_filter; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;
import 'package:smoke_test/src/sdk/src/cloud_formation/model/stack_instance_filter_name.dart';

part 'stack_instance_filter.g.dart';

/// The filter to apply to stack instances
abstract class StackInstanceFilter
    with _i1.AWSEquatable<StackInstanceFilter>
    implements Built<StackInstanceFilter, StackInstanceFilterBuilder> {
  /// The filter to apply to stack instances
  factory StackInstanceFilter({
    StackInstanceFilterName? name,
    String? values,
  }) {
    return _$StackInstanceFilter._(
      name: name,
      values: values,
    );
  }

  /// The filter to apply to stack instances
  factory StackInstanceFilter.build(
          [void Function(StackInstanceFilterBuilder) updates]) =
      _$StackInstanceFilter;

  const StackInstanceFilter._();

  static const List<_i2.SmithySerializer<StackInstanceFilter>> serializers = [
    StackInstanceFilterAwsQuerySerializer()
  ];

  /// The type of filter to apply.
  StackInstanceFilterName? get name;

  /// The status to filter by.
  String? get values;
  @override
  List<Object?> get props => [
        name,
        values,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('StackInstanceFilter')
      ..add(
        'name',
        name,
      )
      ..add(
        'values',
        values,
      );
    return helper.toString();
  }
}

class StackInstanceFilterAwsQuerySerializer
    extends _i2.StructuredSmithySerializer<StackInstanceFilter> {
  const StackInstanceFilterAwsQuerySerializer() : super('StackInstanceFilter');

  @override
  Iterable<Type> get types => const [
        StackInstanceFilter,
        _$StackInstanceFilter,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  StackInstanceFilter deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StackInstanceFilterBuilder();
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
        case 'Name':
          result.name = (serializers.deserialize(
            value,
            specifiedType: const FullType(StackInstanceFilterName),
          ) as StackInstanceFilterName);
        case 'Values':
          result.values = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    StackInstanceFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[
      const _i2.XmlElementName(
        'StackInstanceFilterResponse',
        _i2.XmlNamespace('http://cloudformation.amazonaws.com/doc/2010-05-15/'),
      )
    ];
    final StackInstanceFilter(:name, :values) = object;
    if (name != null) {
      result$
        ..add(const _i2.XmlElementName('Name'))
        ..add(serializers.serialize(
          name,
          specifiedType: const FullType(StackInstanceFilterName),
        ));
    }
    if (values != null) {
      result$
        ..add(const _i2.XmlElementName('Values'))
        ..add(serializers.serialize(
          values,
          specifiedType: const FullType(String),
        ));
    }
    return result$;
  }
}
