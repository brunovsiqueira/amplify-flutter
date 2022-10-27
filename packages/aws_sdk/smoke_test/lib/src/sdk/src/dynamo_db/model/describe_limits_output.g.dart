// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.dynamo_db.model.describe_limits_output;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DescribeLimitsOutput extends DescribeLimitsOutput {
  @override
  final _i2.Int64? accountMaxReadCapacityUnits;
  @override
  final _i2.Int64? accountMaxWriteCapacityUnits;
  @override
  final _i2.Int64? tableMaxReadCapacityUnits;
  @override
  final _i2.Int64? tableMaxWriteCapacityUnits;

  factory _$DescribeLimitsOutput(
          [void Function(DescribeLimitsOutputBuilder)? updates]) =>
      (new DescribeLimitsOutputBuilder()..update(updates))._build();

  _$DescribeLimitsOutput._(
      {this.accountMaxReadCapacityUnits,
      this.accountMaxWriteCapacityUnits,
      this.tableMaxReadCapacityUnits,
      this.tableMaxWriteCapacityUnits})
      : super._();

  @override
  DescribeLimitsOutput rebuild(
          void Function(DescribeLimitsOutputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DescribeLimitsOutputBuilder toBuilder() =>
      new DescribeLimitsOutputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DescribeLimitsOutput &&
        accountMaxReadCapacityUnits == other.accountMaxReadCapacityUnits &&
        accountMaxWriteCapacityUnits == other.accountMaxWriteCapacityUnits &&
        tableMaxReadCapacityUnits == other.tableMaxReadCapacityUnits &&
        tableMaxWriteCapacityUnits == other.tableMaxWriteCapacityUnits;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc(0, accountMaxReadCapacityUnits.hashCode),
                accountMaxWriteCapacityUnits.hashCode),
            tableMaxReadCapacityUnits.hashCode),
        tableMaxWriteCapacityUnits.hashCode));
  }
}

class DescribeLimitsOutputBuilder
    implements Builder<DescribeLimitsOutput, DescribeLimitsOutputBuilder> {
  _$DescribeLimitsOutput? _$v;

  _i2.Int64? _accountMaxReadCapacityUnits;
  _i2.Int64? get accountMaxReadCapacityUnits =>
      _$this._accountMaxReadCapacityUnits;
  set accountMaxReadCapacityUnits(_i2.Int64? accountMaxReadCapacityUnits) =>
      _$this._accountMaxReadCapacityUnits = accountMaxReadCapacityUnits;

  _i2.Int64? _accountMaxWriteCapacityUnits;
  _i2.Int64? get accountMaxWriteCapacityUnits =>
      _$this._accountMaxWriteCapacityUnits;
  set accountMaxWriteCapacityUnits(_i2.Int64? accountMaxWriteCapacityUnits) =>
      _$this._accountMaxWriteCapacityUnits = accountMaxWriteCapacityUnits;

  _i2.Int64? _tableMaxReadCapacityUnits;
  _i2.Int64? get tableMaxReadCapacityUnits => _$this._tableMaxReadCapacityUnits;
  set tableMaxReadCapacityUnits(_i2.Int64? tableMaxReadCapacityUnits) =>
      _$this._tableMaxReadCapacityUnits = tableMaxReadCapacityUnits;

  _i2.Int64? _tableMaxWriteCapacityUnits;
  _i2.Int64? get tableMaxWriteCapacityUnits =>
      _$this._tableMaxWriteCapacityUnits;
  set tableMaxWriteCapacityUnits(_i2.Int64? tableMaxWriteCapacityUnits) =>
      _$this._tableMaxWriteCapacityUnits = tableMaxWriteCapacityUnits;

  DescribeLimitsOutputBuilder() {
    DescribeLimitsOutput._init(this);
  }

  DescribeLimitsOutputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountMaxReadCapacityUnits = $v.accountMaxReadCapacityUnits;
      _accountMaxWriteCapacityUnits = $v.accountMaxWriteCapacityUnits;
      _tableMaxReadCapacityUnits = $v.tableMaxReadCapacityUnits;
      _tableMaxWriteCapacityUnits = $v.tableMaxWriteCapacityUnits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DescribeLimitsOutput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DescribeLimitsOutput;
  }

  @override
  void update(void Function(DescribeLimitsOutputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DescribeLimitsOutput build() => _build();

  _$DescribeLimitsOutput _build() {
    final _$result = _$v ??
        new _$DescribeLimitsOutput._(
            accountMaxReadCapacityUnits: accountMaxReadCapacityUnits,
            accountMaxWriteCapacityUnits: accountMaxWriteCapacityUnits,
            tableMaxReadCapacityUnits: tableMaxReadCapacityUnits,
            tableMaxWriteCapacityUnits: tableMaxWriteCapacityUnits);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas