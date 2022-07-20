// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'topic_following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicFollowing _$TopicFollowingFromJson(Map<String, dynamic> json) {
  return _TopicFollowing.fromJson(json);
}

/// @nodoc
mixin _$TopicFollowing {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', required: true)
  int get entityId => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'topic_id', required: true)
  int get topicId => throw _privateConstructorUsedError;
  Topic? get topic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicFollowingCopyWith<TopicFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicFollowingCopyWith<$Res> {
  factory $TopicFollowingCopyWith(
          TopicFollowing value, $Res Function(TopicFollowing) then) =
      _$TopicFollowingCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'topic_id', required: true) int topicId,
      Topic? topic});

  $EntityCopyWith<$Res>? get entity;
  $TopicCopyWith<$Res>? get topic;
}

/// @nodoc
class _$TopicFollowingCopyWithImpl<$Res>
    implements $TopicFollowingCopyWith<$Res> {
  _$TopicFollowingCopyWithImpl(this._value, this._then);

  final TopicFollowing _value;
  // ignore: unused_field
  final $Res Function(TopicFollowing) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? topicId = freezed,
    Object? topic = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
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
  $TopicCopyWith<$Res>? get topic {
    if (_value.topic == null) {
      return null;
    }

    return $TopicCopyWith<$Res>(_value.topic!, (value) {
      return _then(_value.copyWith(topic: value));
    });
  }
}

/// @nodoc
abstract class _$$_TopicFollowingCopyWith<$Res>
    implements $TopicFollowingCopyWith<$Res> {
  factory _$$_TopicFollowingCopyWith(
          _$_TopicFollowing value, $Res Function(_$_TopicFollowing) then) =
      __$$_TopicFollowingCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'topic_id', required: true) int topicId,
      Topic? topic});

  @override
  $EntityCopyWith<$Res>? get entity;
  @override
  $TopicCopyWith<$Res>? get topic;
}

/// @nodoc
class __$$_TopicFollowingCopyWithImpl<$Res>
    extends _$TopicFollowingCopyWithImpl<$Res>
    implements _$$_TopicFollowingCopyWith<$Res> {
  __$$_TopicFollowingCopyWithImpl(
      _$_TopicFollowing _value, $Res Function(_$_TopicFollowing) _then)
      : super(_value, (v) => _then(v as _$_TopicFollowing));

  @override
  _$_TopicFollowing get _value => super._value as _$_TopicFollowing;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? topicId = freezed,
    Object? topic = freezed,
  }) {
    return _then(_$_TopicFollowing(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopicFollowing
    with DiagnosticableTreeMixin
    implements _TopicFollowing {
  const _$_TopicFollowing(
      {this.id,
      @JsonKey(name: 'entity_id', required: true) required this.entityId,
      this.entity,
      @JsonKey(name: 'topic_id', required: true) required this.topicId,
      this.topic});

  factory _$_TopicFollowing.fromJson(Map<String, dynamic> json) =>
      _$$_TopicFollowingFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  final int entityId;
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'topic_id', required: true)
  final int topicId;
  @override
  final Topic? topic;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopicFollowing(id: $id, entityId: $entityId, entity: $entity, topicId: $topicId, topic: $topic)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopicFollowing'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('topicId', topicId))
      ..add(DiagnosticsProperty('topic', topic));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicFollowing &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.topicId, topicId) &&
            const DeepCollectionEquality().equals(other.topic, topic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(topicId),
      const DeepCollectionEquality().hash(topic));

  @JsonKey(ignore: true)
  @override
  _$$_TopicFollowingCopyWith<_$_TopicFollowing> get copyWith =>
      __$$_TopicFollowingCopyWithImpl<_$_TopicFollowing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicFollowingToJson(this);
  }
}

abstract class _TopicFollowing implements TopicFollowing {
  const factory _TopicFollowing(
      {final int? id,
      @JsonKey(name: 'entity_id', required: true) required final int entityId,
      final Entity? entity,
      @JsonKey(name: 'topic_id', required: true) required final int topicId,
      final Topic? topic}) = _$_TopicFollowing;

  factory _TopicFollowing.fromJson(Map<String, dynamic> json) =
      _$_TopicFollowing.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  int get entityId;
  @override
  Entity? get entity;
  @override
  @JsonKey(name: 'topic_id', required: true)
  int get topicId;
  @override
  Topic? get topic;
  @override
  @JsonKey(ignore: true)
  _$$_TopicFollowingCopyWith<_$_TopicFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}
