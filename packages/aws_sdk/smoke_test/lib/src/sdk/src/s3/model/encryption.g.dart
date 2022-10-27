// GENERATED CODE - DO NOT MODIFY BY HAND

part of smoke_test.s3.model.encryption;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Encryption extends Encryption {
  @override
  final _i2.ServerSideEncryption encryptionType;
  @override
  final String? kmsContext;
  @override
  final String? kmsKeyId;

  factory _$Encryption([void Function(EncryptionBuilder)? updates]) =>
      (new EncryptionBuilder()..update(updates))._build();

  _$Encryption._({required this.encryptionType, this.kmsContext, this.kmsKeyId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        encryptionType, r'Encryption', 'encryptionType');
  }

  @override
  Encryption rebuild(void Function(EncryptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EncryptionBuilder toBuilder() => new EncryptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Encryption &&
        encryptionType == other.encryptionType &&
        kmsContext == other.kmsContext &&
        kmsKeyId == other.kmsKeyId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, encryptionType.hashCode), kmsContext.hashCode),
        kmsKeyId.hashCode));
  }
}

class EncryptionBuilder implements Builder<Encryption, EncryptionBuilder> {
  _$Encryption? _$v;

  _i2.ServerSideEncryption? _encryptionType;
  _i2.ServerSideEncryption? get encryptionType => _$this._encryptionType;
  set encryptionType(_i2.ServerSideEncryption? encryptionType) =>
      _$this._encryptionType = encryptionType;

  String? _kmsContext;
  String? get kmsContext => _$this._kmsContext;
  set kmsContext(String? kmsContext) => _$this._kmsContext = kmsContext;

  String? _kmsKeyId;
  String? get kmsKeyId => _$this._kmsKeyId;
  set kmsKeyId(String? kmsKeyId) => _$this._kmsKeyId = kmsKeyId;

  EncryptionBuilder() {
    Encryption._init(this);
  }

  EncryptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _encryptionType = $v.encryptionType;
      _kmsContext = $v.kmsContext;
      _kmsKeyId = $v.kmsKeyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Encryption other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Encryption;
  }

  @override
  void update(void Function(EncryptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Encryption build() => _build();

  _$Encryption _build() {
    final _$result = _$v ??
        new _$Encryption._(
            encryptionType: BuiltValueNullFieldError.checkNotNull(
                encryptionType, r'Encryption', 'encryptionType'),
            kmsContext: kmsContext,
            kmsKeyId: kmsKeyId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas