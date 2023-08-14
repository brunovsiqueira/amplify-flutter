// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.ec2.model.remove_ipam_operating_region; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'remove_ipam_operating_region.g.dart';

/// Remove an operating Region from an IPAM. Operating Regions are Amazon Web Services Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the Amazon Web Services Regions you select as operating Regions.
///
/// For more information about operating Regions, see [Create an IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the _Amazon VPC IPAM User Guide_
abstract class RemoveIpamOperatingRegion
    with _i1.AWSEquatable<RemoveIpamOperatingRegion>
    implements
        Built<RemoveIpamOperatingRegion, RemoveIpamOperatingRegionBuilder> {
  /// Remove an operating Region from an IPAM. Operating Regions are Amazon Web Services Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the Amazon Web Services Regions you select as operating Regions.
  ///
  /// For more information about operating Regions, see [Create an IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the _Amazon VPC IPAM User Guide_
  factory RemoveIpamOperatingRegion({String? regionName}) {
    return _$RemoveIpamOperatingRegion._(regionName: regionName);
  }

  /// Remove an operating Region from an IPAM. Operating Regions are Amazon Web Services Regions where the IPAM is allowed to manage IP address CIDRs. IPAM only discovers and monitors resources in the Amazon Web Services Regions you select as operating Regions.
  ///
  /// For more information about operating Regions, see [Create an IPAM](https://docs.aws.amazon.com/vpc/latest/ipam/create-ipam.html) in the _Amazon VPC IPAM User Guide_
  factory RemoveIpamOperatingRegion.build(
          [void Function(RemoveIpamOperatingRegionBuilder) updates]) =
      _$RemoveIpamOperatingRegion;

  const RemoveIpamOperatingRegion._();

  static const List<_i2.SmithySerializer<RemoveIpamOperatingRegion>>
      serializers = [RemoveIpamOperatingRegionEc2QuerySerializer()];

  /// The name of the operating Region you want to remove.
  String? get regionName;
  @override
  List<Object?> get props => [regionName];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('RemoveIpamOperatingRegion')
      ..add(
        'regionName',
        regionName,
      );
    return helper.toString();
  }
}

class RemoveIpamOperatingRegionEc2QuerySerializer
    extends _i2.StructuredSmithySerializer<RemoveIpamOperatingRegion> {
  const RemoveIpamOperatingRegionEc2QuerySerializer()
      : super('RemoveIpamOperatingRegion');

  @override
  Iterable<Type> get types => const [
        RemoveIpamOperatingRegion,
        _$RemoveIpamOperatingRegion,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'ec2Query',
        )
      ];
  @override
  RemoveIpamOperatingRegion deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoveIpamOperatingRegionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'RegionName':
          result.regionName = (serializers.deserialize(
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
    RemoveIpamOperatingRegion object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[
      const _i2.XmlElementName(
        'RemoveIpamOperatingRegionResponse',
        _i2.XmlNamespace('http://ec2.amazonaws.com/doc/2016-11-15'),
      )
    ];
    final RemoveIpamOperatingRegion(:regionName) = object;
    if (regionName != null) {
      result$
        ..add(const _i2.XmlElementName('RegionName'))
        ..add(serializers.serialize(
          regionName,
          specifiedType: const FullType(String),
        ));
    }
    return result$;
  }
}
