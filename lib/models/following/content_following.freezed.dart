// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentFollowing _$ContentFollowingFromJson(Map<String, dynamic> json) {
  return _ContentFollowing.fromJson(json);
}

/// @nodoc
mixin _$ContentFollowing {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', required: true)
  int get entityId => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id', required: true)
  int get contentId => throw _privateConstructorUsedError;
  Content? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentFollowingCopyWith<ContentFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentFollowingCopyWith<$Res> {
  factory $ContentFollowingCopyWith(
          ContentFollowing value, $Res Function(ContentFollowing) then) =
      _$ContentFollowingCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Content? content});

  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class _$ContentFollowingCopyWithImpl<$Res>
    implements $ContentFollowingCopyWith<$Res> {
  _$ContentFollowingCopyWithImpl(this._value, this._then);

  final ContentFollowing _value;
  // ignore: unused_field
  final $Res Function(ContentFollowing) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? contentId = freezed,
    Object? content = freezed,
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
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
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
abstract class _$$_ContentFollowingCopyWith<$Res>
    implements $ContentFollowingCopyWith<$Res> {
  factory _$$_ContentFollowingCopyWith(
          _$_ContentFollowing value, $Res Function(_$_ContentFollowing) then) =
      __$$_ContentFollowingCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      Entity? entity,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Content? content});

  @override
  $EntityCopyWith<$Res>? get entity;
}

/// @nodoc
class __$$_ContentFollowingCopyWithImpl<$Res>
    extends _$ContentFollowingCopyWithImpl<$Res>
    implements _$$_ContentFollowingCopyWith<$Res> {
  __$$_ContentFollowingCopyWithImpl(
      _$_ContentFollowing _value, $Res Function(_$_ContentFollowing) _then)
      : super(_value, (v) => _then(v as _$_ContentFollowing));

  @override
  _$_ContentFollowing get _value => super._value as _$_ContentFollowing;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? contentId = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ContentFollowing(
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
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentFollowing
    with DiagnosticableTreeMixin
    implements _ContentFollowing {
  const _$_ContentFollowing(
      {this.id,
      @JsonKey(name: 'entity_id', required: true) required this.entityId,
      this.entity,
      @JsonKey(name: 'content_id', required: true) required this.contentId,
      this.content});

  factory _$_ContentFollowing.fromJson(Map<String, dynamic> json) =>
      _$$_ContentFollowingFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  final int entityId;
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'content_id', required: true)
  final int contentId;
  @override
  final Content? content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentFollowing(id: $id, entityId: $entityId, entity: $entity, contentId: $contentId, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentFollowing'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentFollowing &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_ContentFollowingCopyWith<_$_ContentFollowing> get copyWith =>
      __$$_ContentFollowingCopyWithImpl<_$_ContentFollowing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentFollowingToJson(this);
  }
}

abstract class _ContentFollowing implements ContentFollowing {
  const factory _ContentFollowing(
      {final int? id,
      @JsonKey(name: 'entity_id', required: true) required final int entityId,
      final Entity? entity,
      @JsonKey(name: 'content_id', required: true) required final int contentId,
      final Content? content}) = _$_ContentFollowing;

  factory _ContentFollowing.fromJson(Map<String, dynamic> json) =
      _$_ContentFollowing.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  int get entityId;
  @override
  Entity? get entity;
  @override
  @JsonKey(name: 'content_id', required: true)
  int get contentId;
  @override
  Content? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ContentFollowingCopyWith<_$_ContentFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}
