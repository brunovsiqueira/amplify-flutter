// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.api_gateway.model.get_gateway_responses_request;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetGatewayResponsesRequest extends GetGatewayResponsesRequest {
  @override
  final int? limit;
  @override
  final String? position;
  @override
  final String restApiId;

  factory _$GetGatewayResponsesRequest(
          [void Function(GetGatewayResponsesRequestBuilder)? updates]) =>
      (new GetGatewayResponsesRequestBuilder()..update(updates))._build();

  _$GetGatewayResponsesRequest._(
      {this.limit, this.position, required this.restApiId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        restApiId, r'GetGatewayResponsesRequest', 'restApiId');
  }

  @override
  GetGatewayResponsesRequest rebuild(
          void Function(GetGatewayResponsesRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetGatewayResponsesRequestBuilder toBuilder() =>
      new GetGatewayResponsesRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetGatewayResponsesRequest &&
        limit == other.limit &&
        position == other.position &&
        restApiId == other.restApiId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, limit.hashCode), position.hashCode), restApiId.hashCode));
  }
}

class GetGatewayResponsesRequestBuilder
    implements
        Builder<GetGatewayResponsesRequest, GetGatewayResponsesRequestBuilder> {
  _$GetGatewayResponsesRequest? _$v;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _restApiId;
  String? get restApiId => _$this._restApiId;
  set restApiId(String? restApiId) => _$this._restApiId = restApiId;

  GetGatewayResponsesRequestBuilder() {
    GetGatewayResponsesRequest._init(this);
  }

  GetGatewayResponsesRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _limit = $v.limit;
      _position = $v.position;
      _restApiId = $v.restApiId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetGatewayResponsesRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetGatewayResponsesRequest;
  }

  @override
  void update(void Function(GetGatewayResponsesRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetGatewayResponsesRequest build() => _build();

  _$GetGatewayResponsesRequest _build() {
    final _$result = _$v ??
        new _$GetGatewayResponsesRequest._(
            limit: limit,
            position: position,
            restApiId: BuiltValueNullFieldError.checkNotNull(
                restApiId, r'GetGatewayResponsesRequest', 'restApiId'));
    replace(_$result);
    return _$result;
  }
}

class _$GetGatewayResponsesRequestPayload
    extends GetGatewayResponsesRequestPayload {
  factory _$GetGatewayResponsesRequestPayload(
          [void Function(GetGatewayResponsesRequestPayloadBuilder)? updates]) =>
      (new GetGatewayResponsesRequestPayloadBuilder()..update(updates))
          ._build();

  _$GetGatewayResponsesRequestPayload._() : super._();

  @override
  GetGatewayResponsesRequestPayload rebuild(
          void Function(GetGatewayResponsesRequestPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetGatewayResponsesRequestPayloadBuilder toBuilder() =>
      new GetGatewayResponsesRequestPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetGatewayResponsesRequestPayload;
  }

  @override
  int get hashCode {
    return 607546455;
  }
}

class GetGatewayResponsesRequestPayloadBuilder
    implements
        Builder<GetGatewayResponsesRequestPayload,
            GetGatewayResponsesRequestPayloadBuilder> {
  _$GetGatewayResponsesRequestPayload? _$v;

  GetGatewayResponsesRequestPayloadBuilder() {
    GetGatewayResponsesRequestPayload._init(this);
  }

  @override
  void replace(GetGatewayResponsesRequestPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetGatewayResponsesRequestPayload;
  }

  @override
  void update(
      void Function(GetGatewayResponsesRequestPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetGatewayResponsesRequestPayload build() => _build();

  _$GetGatewayResponsesRequestPayload _build() {
    final _$result = _$v ?? new _$GetGatewayResponsesRequestPayload._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas