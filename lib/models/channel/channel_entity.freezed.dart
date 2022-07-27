// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChannelEntity _$ChannelEntityFromJson(Map<String, dynamic> json) {
  return _ChannelEntity.fromJson(json);
}

/// @nodoc
mixin _$ChannelEntity {
  int? get id => throw _privateConstructorUsedError;
  ChannelRole? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', required: true)
  int get entityId => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel_id', required: true)
  int get channelId => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelEntityCopyWith<ChannelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelEntityCopyWith<$Res> {
  factory $ChannelEntityCopyWith(
          ChannelEntity value, $Res Function(ChannelEntity) then) =
      _$ChannelEntityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      ChannelRole? role,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'channel_id', required: true) int channelId,
      Channel? channel});

  $EntityCopyWith<$Res>? get entity;
  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$ChannelEntityCopyWithImpl<$Res>
    implements $ChannelEntityCopyWith<$Res> {
  _$ChannelEntityCopyWithImpl(this._value, this._then);

  final ChannelEntity _value;
  // ignore: unused_field
  final $Res Function(ChannelEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? channelId = freezed,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChannelRole?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      channelId: channelId == freezed
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as int,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
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

  @override
  $ChannelCopyWith<$Res>? get channel {
    if (_value.channel == null) {
      return null;
    }

    return $ChannelCopyWith<$Res>(_value.channel!, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChannelEntityCopyWith<$Res>
    implements $ChannelEntityCopyWith<$Res> {
  factory _$$_ChannelEntityCopyWith(
          _$_ChannelEntity value, $Res Function(_$_ChannelEntity) then) =
      __$$_ChannelEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      ChannelRole? role,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'channel_id', required: true) int channelId,
      Channel? channel});

  @override
  $EntityCopyWith<$Res>? get entity;
  @override
  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$$_ChannelEntityCopyWithImpl<$Res>
    extends _$ChannelEntityCopyWithImpl<$Res>
    implements _$$_ChannelEntityCopyWith<$Res> {
  __$$_ChannelEntityCopyWithImpl(
      _$_ChannelEntity _value, $Res Function(_$_ChannelEntity) _then)
      : super(_value, (v) => _then(v as _$_ChannelEntity));

  @override
  _$_ChannelEntity get _value => super._value as _$_ChannelEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? channelId = freezed,
    Object? channel = freezed,
  }) {
    return _then(_$_ChannelEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChannelRole?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      channelId: channelId == freezed
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as int,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelEntity with DiagnosticableTreeMixin implements _ChannelEntity {
  const _$_ChannelEntity(
      {this.id,
      this.role,
      @JsonKey(name: 'entity_id', required: true) required this.entityId,
      this.entity,
      @JsonKey(name: 'channel_id', required: true) required this.channelId,
      this.channel});

  factory _$_ChannelEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelEntityFromJson(json);

  @override
  final int? id;
  @override
  final ChannelRole? role;
  @override
  @JsonKey(name: 'entity_id', required: true)
  final int entityId;
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'channel_id', required: true)
  final int channelId;
  @override
  final Channel? channel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChannelEntity(id: $id, role: $role, entityId: $entityId, entity: $entity, channelId: $channelId, channel: $channel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChannelEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('channelId', channelId))
      ..add(DiagnosticsProperty('channel', channel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChannelEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.channelId, channelId) &&
            const DeepCollectionEquality().equals(other.channel, channel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(channelId),
      const DeepCollectionEquality().hash(channel));

  @JsonKey(ignore: true)
  @override
  _$$_ChannelEntityCopyWith<_$_ChannelEntity> get copyWith =>
      __$$_ChannelEntityCopyWithImpl<_$_ChannelEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelEntityToJson(this);
  }
}

abstract class _ChannelEntity implements ChannelEntity {
  const factory _ChannelEntity(
      {final int? id,
      final ChannelRole? role,
      @JsonKey(name: 'entity_id', required: true) required final int entityId,
      final Entity? entity,
      @JsonKey(name: 'channel_id', required: true) required final int channelId,
      final Channel? channel}) = _$_ChannelEntity;

  factory _ChannelEntity.fromJson(Map<String, dynamic> json) =
      _$_ChannelEntity.fromJson;

  @override
  int? get id;
  @override
  ChannelRole? get role;
  @override
  @JsonKey(name: 'entity_id', required: true)
  int get entityId;
  @override
  Entity? get entity;
  @override
  @JsonKey(name: 'channel_id', required: true)
  int get channelId;
  @override
  Channel? get channel;
  @override
  @JsonKey(ignore: true)
  _$$_ChannelEntityCopyWith<_$_ChannelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
