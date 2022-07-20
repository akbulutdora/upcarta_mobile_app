// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcarta_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'unconfirmed_email')
  String? get unconfirmedEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_email')
  String? get displayEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;
  List<Identity>? get identities => throw _privateConstructorUsedError;
  Entity? get entity =>
      throw _privateConstructorUsedError; //todo : relational required
  @JsonKey(name: 'entity_id')
  int? get entityId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String email,
      @JsonKey(name: 'unconfirmed_email') String? unconfirmedEmail,
      @JsonKey(name: 'display_email') String? displayEmail,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      String? password,
      Role? role,
      List<Identity>? identities,
      Entity? entity,
      @JsonKey(name: 'entity_id') int? entityId});

  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? unconfirmedEmail = freezed,
    Object? displayEmail = freezed,
    Object? confirmedAt = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? identities = freezed,
    Object? entity = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      unconfirmedEmail: unconfirmedEmail == freezed
          ? _value.unconfirmedEmail
          : unconfirmedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      displayEmail: displayEmail == freezed
          ? _value.displayEmail
          : displayEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmedAt: confirmedAt == freezed
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      identities: identities == freezed
          ? _value.identities
          : identities // ignore: cast_nullable_to_non_nullable
              as List<Identity>?,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $EntityCopyWith<$Res>? get entity {
    if (_value.entity == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.entity!, (value) {
      return _then(_value.copyWith(entity: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String email,
      @JsonKey(name: 'unconfirmed_email') String? unconfirmedEmail,
      @JsonKey(name: 'display_email') String? displayEmail,
      @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
      String? password,
      Role? role,
      List<Identity>? identities,
      Entity? entity,
      @JsonKey(name: 'entity_id') int? entityId});

  @override
  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? unconfirmedEmail = freezed,
    Object? displayEmail = freezed,
    Object? confirmedAt = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? identities = freezed,
    Object? entity = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      unconfirmedEmail: unconfirmedEmail == freezed
          ? _value.unconfirmedEmail
          : unconfirmedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      displayEmail: displayEmail == freezed
          ? _value.displayEmail
          : displayEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmedAt: confirmedAt == freezed
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      identities: identities == freezed
          ? _value._identities
          : identities // ignore: cast_nullable_to_non_nullable
              as List<Identity>?,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {this.id,
      required this.email,
      @JsonKey(name: 'unconfirmed_email') this.unconfirmedEmail,
      @JsonKey(name: 'display_email') this.displayEmail,
      @JsonKey(name: 'confirmed_at') this.confirmedAt,
      this.password,
      this.role,
      final List<Identity>? identities,
      this.entity,
      @JsonKey(name: 'entity_id') this.entityId})
      : _identities = identities;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int? id;
  @override
  final String email;
  @override
  @JsonKey(name: 'unconfirmed_email')
  final String? unconfirmedEmail;
  @override
  @JsonKey(name: 'display_email')
  final String? displayEmail;
  @override
  @JsonKey(name: 'confirmed_at')
  final DateTime? confirmedAt;
  @override
  final String? password;
  @override
  final Role? role;
  final List<Identity>? _identities;
  @override
  List<Identity>? get identities {
    final value = _identities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Entity? entity;
//todo : relational required
  @override
  @JsonKey(name: 'entity_id')
  final int? entityId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, email: $email, unconfirmedEmail: $unconfirmedEmail, displayEmail: $displayEmail, confirmedAt: $confirmedAt, password: $password, role: $role, identities: $identities, entity: $entity, entityId: $entityId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('unconfirmedEmail', unconfirmedEmail))
      ..add(DiagnosticsProperty('displayEmail', displayEmail))
      ..add(DiagnosticsProperty('confirmedAt', confirmedAt))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('identities', identities))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('entityId', entityId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.unconfirmedEmail, unconfirmedEmail) &&
            const DeepCollectionEquality()
                .equals(other.displayEmail, displayEmail) &&
            const DeepCollectionEquality()
                .equals(other.confirmedAt, confirmedAt) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other._identities, _identities) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.entityId, entityId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(unconfirmedEmail),
      const DeepCollectionEquality().hash(displayEmail),
      const DeepCollectionEquality().hash(confirmedAt),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(_identities),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(entityId));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? id,
      required final String email,
      @JsonKey(name: 'unconfirmed_email') final String? unconfirmedEmail,
      @JsonKey(name: 'display_email') final String? displayEmail,
      @JsonKey(name: 'confirmed_at') final DateTime? confirmedAt,
      final String? password,
      final Role? role,
      final List<Identity>? identities,
      final Entity? entity,
      @JsonKey(name: 'entity_id') final int? entityId}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int? get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'unconfirmed_email')
  String? get unconfirmedEmail;
  @override
  @JsonKey(name: 'display_email')
  String? get displayEmail;
  @override
  @JsonKey(name: 'confirmed_at')
  DateTime? get confirmedAt;
  @override
  String? get password;
  @override
  Role? get role;
  @override
  List<Identity>? get identities;
  @override
  Entity? get entity;
  @override //todo : relational required
  @JsonKey(name: 'entity_id')
  int? get entityId;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
