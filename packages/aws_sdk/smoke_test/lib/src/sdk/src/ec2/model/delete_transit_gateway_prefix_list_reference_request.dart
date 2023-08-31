// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library smoke_test.ec2.model.delete_transit_gateway_prefix_list_reference_request; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'delete_transit_gateway_prefix_list_reference_request.g.dart';

abstract class DeleteTransitGatewayPrefixListReferenceRequest
    with
        _i1.HttpInput<DeleteTransitGatewayPrefixListReferenceRequest>,
        _i2.AWSEquatable<DeleteTransitGatewayPrefixListReferenceRequest>
    implements
        Built<DeleteTransitGatewayPrefixListReferenceRequest,
            DeleteTransitGatewayPrefixListReferenceRequestBuilder> {
  factory DeleteTransitGatewayPrefixListReferenceRequest({
    String? transitGatewayRouteTableId,
    String? prefixListId,
    bool? dryRun,
  }) {
    dryRun ??= false;
    return _$DeleteTransitGatewayPrefixListReferenceRequest._(
      transitGatewayRouteTableId: transitGatewayRouteTableId,
      prefixListId: prefixListId,
      dryRun: dryRun,
    );
  }

  factory DeleteTransitGatewayPrefixListReferenceRequest.build(
      [void Function(DeleteTransitGatewayPrefixListReferenceRequestBuilder)
          updates]) = _$DeleteTransitGatewayPrefixListReferenceRequest;

  const DeleteTransitGatewayPrefixListReferenceRequest._();

  factory DeleteTransitGatewayPrefixListReferenceRequest.fromRequest(
    DeleteTransitGatewayPrefixListReferenceRequest payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  static const List<
          _i1.SmithySerializer<DeleteTransitGatewayPrefixListReferenceRequest>>
      serializers = [
    DeleteTransitGatewayPrefixListReferenceRequestEc2QuerySerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(DeleteTransitGatewayPrefixListReferenceRequestBuilder b) {
    b.dryRun = false;
  }

  /// The ID of the route table.
  String? get transitGatewayRouteTableId;

  /// The ID of the prefix list.
  String? get prefixListId;

  /// Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
  bool get dryRun;
  @override
  DeleteTransitGatewayPrefixListReferenceRequest getPayload() => this;
  @override
  List<Object?> get props => [
        transitGatewayRouteTableId,
        prefixListId,
        dryRun,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(
        'DeleteTransitGatewayPrefixListReferenceRequest')
      ..add(
        'transitGatewayRouteTableId',
        transitGatewayRouteTableId,
      )
      ..add(
        'prefixListId',
        prefixListId,
      )
      ..add(
        'dryRun',
        dryRun,
      );
    return helper.toString();
  }
}

class DeleteTransitGatewayPrefixListReferenceRequestEc2QuerySerializer
    extends _i1.StructuredSmithySerializer<
        DeleteTransitGatewayPrefixListReferenceRequest> {
  const DeleteTransitGatewayPrefixListReferenceRequestEc2QuerySerializer()
      : super('DeleteTransitGatewayPrefixListReferenceRequest');

  @override
  Iterable<Type> get types => const [
        DeleteTransitGatewayPrefixListReferenceRequest,
        _$DeleteTransitGatewayPrefixListReferenceRequest,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'ec2Query',
        )
      ];
  @override
  DeleteTransitGatewayPrefixListReferenceRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteTransitGatewayPrefixListReferenceRequestBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'TransitGatewayRouteTableId':
          result.transitGatewayRouteTableId = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'PrefixListId':
          result.prefixListId = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'DryRun':
          result.dryRun = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DeleteTransitGatewayPrefixListReferenceRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[
      const _i1.XmlElementName(
        'DeleteTransitGatewayPrefixListReferenceRequestResponse',
        _i1.XmlNamespace('http://ec2.amazonaws.com/doc/2016-11-15'),
      )
    ];
    final DeleteTransitGatewayPrefixListReferenceRequest(
      :transitGatewayRouteTableId,
      :prefixListId,
      :dryRun
    ) = object;
    if (transitGatewayRouteTableId != null) {
      result$
        ..add(const _i1.XmlElementName('TransitGatewayRouteTableId'))
        ..add(serializers.serialize(
          transitGatewayRouteTableId,
          specifiedType: const FullType(String),
        ));
    }
    if (prefixListId != null) {
      result$
        ..add(const _i1.XmlElementName('PrefixListId'))
        ..add(serializers.serialize(
          prefixListId,
          specifiedType: const FullType(String),
        ));
    }
    result$
      ..add(const _i1.XmlElementName('DryRun'))
      ..add(serializers.serialize(
        dryRun,
        specifiedType: const FullType(bool),
      ));
    return result$;
  }
}