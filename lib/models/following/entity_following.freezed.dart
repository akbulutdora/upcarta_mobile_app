// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entity_following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntityFollowing _$EntityFollowingFromJson(Map<String, dynamic> json) {
  return _EntityFollowing.fromJson(json);
}

/// @nodoc
mixin _$EntityFollowing {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_entity_id', required: true)
  int get followedEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_entity')
  Entity? get followedEntity => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_entity_id', required: true)
  int get followingEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_entity')
  Entity? get followingEntity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityFollowingCopyWith<EntityFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityFollowingCopyWith<$Res> {
  factory $EntityFollowingCopyWith(
          EntityFollowing value, $Res Function(EntityFollowing) then) =
      _$EntityFollowingCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'followed_entity_id', required: true)
          int followedEntityId,
      @JsonKey(name: 'followed_entity')
          Entity? followedEntity,
      @JsonKey(name: 'following_entity_id', required: true)
          int followingEntityId,
      @JsonKey(name: 'following_entity')
          Entity? followingEntity});

  $EntityCopyWith<$Res>? get followedEntity;
  $EntityCopyWith<$Res>? get followingEntity;
}

/// @nodoc
class _$EntityFollowingCopyWithImpl<$Res>
    implements $EntityFollowingCopyWith<$Res> {
  _$EntityFollowingCopyWithImpl(this._value, this._then);

  final EntityFollowing _value;
  // ignore: unused_field
  final $Res Function(EntityFollowing) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? followedEntityId = freezed,
    Object? followedEntity = freezed,
    Object? followingEntityId = freezed,
    Object? followingEntity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      followedEntityId: followedEntityId == freezed
          ? _value.followedEntityId
          : followedEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      followedEntity: followedEntity == freezed
          ? _value.followedEntity
          : followedEntity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      followingEntityId: followingEntityId == freezed
          ? _value.followingEntityId
          : followingEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      followingEntity: followingEntity == freezed
          ? _value.followingEntity
          : followingEntity // ignore: cast_nullable_to_non_nullable
              as Entity?,
    ));
  }

  @override
  $EntityCopyWith<$Res>? get followedEntity {
    if (_value.followedEntity == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.followedEntity!, (value) {
      return _then(_value.copyWith(followedEntity: value));
    });
  }

  @override
  $EntityCopyWith<$Res>? get followingEntity {
    if (_value.followingEntity == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.followingEntity!, (value) {
      return _then(_value.copyWith(followingEntity: value));
    });
  }
}

/// @nodoc
abstract class _$$_EntityFollowingCopyWith<$Res>
    implements $EntityFollowingCopyWith<$Res> {
  factory _$$_EntityFollowingCopyWith(
          _$_EntityFollowing value, $Res Function(_$_EntityFollowing) then) =
      __$$_EntityFollowingCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'followed_entity_id', required: true)
          int followedEntityId,
      @JsonKey(name: 'followed_entity')
          Entity? followedEntity,
      @JsonKey(name: 'following_entity_id', required: true)
          int followingEntityId,
      @JsonKey(name: 'following_entity')
          Entity? followingEntity});

  @override
  $EntityCopyWith<$Res>? get followedEntity;
  @override
  $EntityCopyWith<$Res>? get followingEntity;
}

/// @nodoc
class __$$_EntityFollowingCopyWithImpl<$Res>
    extends _$EntityFollowingCopyWithImpl<$Res>
    implements _$$_EntityFollowingCopyWith<$Res> {
  __$$_EntityFollowingCopyWithImpl(
      _$_EntityFollowing _value, $Res Function(_$_EntityFollowing) _then)
      : super(_value, (v) => _then(v as _$_EntityFollowing));

  @override
  _$_EntityFollowing get _value => super._value as _$_EntityFollowing;

  @override
  $Res call({
    Object? id = freezed,
    Object? followedEntityId = freezed,
    Object? followedEntity = freezed,
    Object? followingEntityId = freezed,
    Object? followingEntity = freezed,
  }) {
    return _then(_$_EntityFollowing(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      followedEntityId: followedEntityId == freezed
          ? _value.followedEntityId
          : followedEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      followedEntity: followedEntity == freezed
          ? _value.followedEntity
          : followedEntity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      followingEntityId: followingEntityId == freezed
          ? _value.followingEntityId
          : followingEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      followingEntity: followingEntity == freezed
          ? _value.followingEntity
          : followingEntity // ignore: cast_nullable_to_non_nullable
              as Entity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityFollowing
    with DiagnosticableTreeMixin
    implements _EntityFollowing {
  const _$_EntityFollowing(
      {this.id,
      @JsonKey(name: 'followed_entity_id', required: true)
          required this.followedEntityId,
      @JsonKey(name: 'followed_entity')
          this.followedEntity,
      @JsonKey(name: 'following_entity_id', required: true)
          required this.followingEntityId,
      @JsonKey(name: 'following_entity')
          this.followingEntity});

  factory _$_EntityFollowing.fromJson(Map<String, dynamic> json) =>
      _$$_EntityFollowingFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'followed_entity_id', required: true)
  final int followedEntityId;
  @override
  @JsonKey(name: 'followed_entity')
  final Entity? followedEntity;
  @override
  @JsonKey(name: 'following_entity_id', required: true)
  final int followingEntityId;
  @override
  @JsonKey(name: 'following_entity')
  final Entity? followingEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EntityFollowing(id: $id, followedEntityId: $followedEntityId, followedEntity: $followedEntity, followingEntityId: $followingEntityId, followingEntity: $followingEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EntityFollowing'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('followedEntityId', followedEntityId))
      ..add(DiagnosticsProperty('followedEntity', followedEntity))
      ..add(DiagnosticsProperty('followingEntityId', followingEntityId))
      ..add(DiagnosticsProperty('followingEntity', followingEntity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityFollowing &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.followedEntityId, followedEntityId) &&
            const DeepCollectionEquality()
                .equals(other.followedEntity, followedEntity) &&
            const DeepCollectionEquality()
                .equals(other.followingEntityId, followingEntityId) &&
            const DeepCollectionEquality()
                .equals(other.followingEntity, followingEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(followedEntityId),
      const DeepCollectionEquality().hash(followedEntity),
      const DeepCollectionEquality().hash(followingEntityId),
      const DeepCollectionEquality().hash(followingEntity));

  @JsonKey(ignore: true)
  @override
  _$$_EntityFollowingCopyWith<_$_EntityFollowing> get copyWith =>
      __$$_EntityFollowingCopyWithImpl<_$_EntityFollowing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityFollowingToJson(this);
  }
}

abstract class _EntityFollowing implements EntityFollowing {
  const factory _EntityFollowing(
      {final int? id,
      @JsonKey(name: 'followed_entity_id', required: true)
          required final int followedEntityId,
      @JsonKey(name: 'followed_entity')
          final Entity? followedEntity,
      @JsonKey(name: 'following_entity_id', required: true)
          required final int followingEntityId,
      @JsonKey(name: 'following_entity')
          final Entity? followingEntity}) = _$_EntityFollowing;

  factory _EntityFollowing.fromJson(Map<String, dynamic> json) =
      _$_EntityFollowing.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'followed_entity_id', required: true)
  int get followedEntityId;
  @override
  @JsonKey(name: 'followed_entity')
  Entity? get followedEntity;
  @override
  @JsonKey(name: 'following_entity_id', required: true)
  int get followingEntityId;
  @override
  @JsonKey(name: 'following_entity')
  Entity? get followingEntity;
  @override
  @JsonKey(ignore: true)
  _$$_EntityFollowingCopyWith<_$_EntityFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}
