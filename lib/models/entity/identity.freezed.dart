// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return _Identity.fromJson(json);
}

/// @nodoc
mixin _$Identity {
  int? get id => throw _privateConstructorUsedError;
  Provider get provider => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get secret => throw _privateConstructorUsedError;
  User? get user =>
      throw _privateConstructorUsedError; //todo: realtional required tam olarak nedir anladigim gibiyse required yapmayalim mi, eger oyle ise diger kisimlarda da degistir
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityCopyWith<Identity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityCopyWith<$Res> {
  factory $IdentityCopyWith(Identity value, $Res Function(Identity) then) =
      _$IdentityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      Provider provider,
      String uid,
      String? email,
      String? name,
      String? phone,
      String? token,
      String? secret,
      User? user,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$IdentityCopyWithImpl<$Res> implements $IdentityCopyWith<$Res> {
  _$IdentityCopyWithImpl(this._value, this._then);

  final Identity _value;
  // ignore: unused_field
  final $Res Function(Identity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? provider = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? token = freezed,
    Object? secret = freezed,
    Object? user = freezed,
    Object? userId = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_IdentityCopyWith<$Res> implements $IdentityCopyWith<$Res> {
  factory _$$_IdentityCopyWith(
          _$_Identity value, $Res Function(_$_Identity) then) =
      __$$_IdentityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      Provider provider,
      String uid,
      String? email,
      String? name,
      String? phone,
      String? token,
      String? secret,
      User? user,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_IdentityCopyWithImpl<$Res> extends _$IdentityCopyWithImpl<$Res>
    implements _$$_IdentityCopyWith<$Res> {
  __$$_IdentityCopyWithImpl(
      _$_Identity _value, $Res Function(_$_Identity) _then)
      : super(_value, (v) => _then(v as _$_Identity));

  @override
  _$_Identity get _value => super._value as _$_Identity;

  @override
  $Res call({
    Object? id = freezed,
    Object? provider = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? token = freezed,
    Object? secret = freezed,
    Object? user = freezed,
    Object? userId = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Identity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Identity with DiagnosticableTreeMixin implements _Identity {
  const _$_Identity(
      {this.id,
      required this.provider,
      required this.uid,
      this.email,
      this.name,
      this.phone,
      this.token,
      this.secret,
      this.user,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'inserted_at') this.insertedAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_Identity.fromJson(Map<String, dynamic> json) =>
      _$$_IdentityFromJson(json);

  @override
  final int? id;
  @override
  final Provider provider;
  @override
  final String uid;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? token;
  @override
  final String? secret;
  @override
  final User? user;
//todo: realtional required tam olarak nedir anladigim gibiyse required yapmayalim mi, eger oyle ise diger kisimlarda da degistir
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Identity(id: $id, provider: $provider, uid: $uid, email: $email, name: $name, phone: $phone, token: $token, secret: $secret, user: $user, userId: $userId, insertedAt: $insertedAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Identity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('secret', secret))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('insertedAt', insertedAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Identity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.secret, secret) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(secret),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(insertedAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_IdentityCopyWith<_$_Identity> get copyWith =>
      __$$_IdentityCopyWithImpl<_$_Identity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdentityToJson(this);
  }
}

abstract class _Identity implements Identity {
  const factory _Identity(
      {final int? id,
      required final Provider provider,
      required final String uid,
      final String? email,
      final String? name,
      final String? phone,
      final String? token,
      final String? secret,
      final User? user,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'inserted_at') final DateTime? insertedAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_Identity;

  factory _Identity.fromJson(Map<String, dynamic> json) = _$_Identity.fromJson;

  @override
  int? get id;
  @override
  Provider get provider;
  @override
  String get uid;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get token;
  @override
  String? get secret;
  @override
  User? get user;
  @override //todo: realtional required tam olarak nedir anladigim gibiyse required yapmayalim mi, eger oyle ise diger kisimlarda da degistir
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_IdentityCopyWith<_$_Identity> get copyWith =>
      throw _privateConstructorUsedError;
}
