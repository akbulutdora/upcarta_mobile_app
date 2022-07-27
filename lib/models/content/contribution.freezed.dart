// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contribution _$ContributionFromJson(Map<String, dynamic> json) {
  return _Contribution.fromJson(json);
}

/// @nodoc
mixin _$Contribution {
  int? get id => throw _privateConstructorUsedError;

  /// (author, creator, speaker, host, guest, instructor)
  ContributionRole? get role => throw _privateConstructorUsedError;
  Content? get content => throw _privateConstructorUsedError;

  /// related content id
  @JsonKey(name: 'content_id', required: true)
  int get contentId => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', required: true)
  int get entityId => throw _privateConstructorUsedError;

  /// position of appearance
  int? get pos => throw _privateConstructorUsedError; // iki tane entity var ?
  /// Entity object (profile) who added the contribution
  @JsonKey(name: 'added_by')
  Entity? get addedBy => throw _privateConstructorUsedError;

  /// Entity object (profile) id who added the contribution
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionCopyWith<Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) then) =
      _$ContributionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      ContributionRole? role,
      Content? content,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Entity? entity,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      int? pos,
      @JsonKey(name: 'added_by') Entity? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById});

  $ContentCopyWith<$Res>? get content;
  $EntityCopyWith<$Res>? get entity;
  $EntityCopyWith<$Res>? get addedBy;
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res> implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._value, this._then);

  final Contribution _value;
  // ignore: unused_field
  final $Res Function(Contribution) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? entity = freezed,
    Object? entityId = freezed,
    Object? pos = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ContributionRole?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value));
    });
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
  $EntityCopyWith<$Res>? get addedBy {
    if (_value.addedBy == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.addedBy!, (value) {
      return _then(_value.copyWith(addedBy: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContributionCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$$_ContributionCopyWith(
          _$_Contribution value, $Res Function(_$_Contribution) then) =
      __$$_ContributionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      ContributionRole? role,
      Content? content,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Entity? entity,
      @JsonKey(name: 'entity_id', required: true) int entityId,
      int? pos,
      @JsonKey(name: 'added_by') Entity? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById});

  @override
  $ContentCopyWith<$Res>? get content;
  @override
  $EntityCopyWith<$Res>? get entity;
  @override
  $EntityCopyWith<$Res>? get addedBy;
}

/// @nodoc
class __$$_ContributionCopyWithImpl<$Res>
    extends _$ContributionCopyWithImpl<$Res>
    implements _$$_ContributionCopyWith<$Res> {
  __$$_ContributionCopyWithImpl(
      _$_Contribution _value, $Res Function(_$_Contribution) _then)
      : super(_value, (v) => _then(v as _$_Contribution));

  @override
  _$_Contribution get _value => super._value as _$_Contribution;

  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? entity = freezed,
    Object? entityId = freezed,
    Object? pos = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
  }) {
    return _then(_$_Contribution(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ContributionRole?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contribution with DiagnosticableTreeMixin implements _Contribution {
  const _$_Contribution(
      {this.id,
      this.role,
      this.content,
      @JsonKey(name: 'content_id', required: true) required this.contentId,
      this.entity,
      @JsonKey(name: 'entity_id', required: true) required this.entityId,
      this.pos,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById});

  factory _$_Contribution.fromJson(Map<String, dynamic> json) =>
      _$$_ContributionFromJson(json);

  @override
  final int? id;

  /// (author, creator, speaker, host, guest, instructor)
  @override
  final ContributionRole? role;
  @override
  final Content? content;

  /// related content id
  @override
  @JsonKey(name: 'content_id', required: true)
  final int contentId;
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'entity_id', required: true)
  final int entityId;

  /// position of appearance
  @override
  final int? pos;
// iki tane entity var ?
  /// Entity object (profile) who added the contribution
  @override
  @JsonKey(name: 'added_by')
  final Entity? addedBy;

  /// Entity object (profile) id who added the contribution
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Contribution(id: $id, role: $role, content: $content, contentId: $contentId, entity: $entity, entityId: $entityId, pos: $pos, addedBy: $addedBy, addedById: $addedById)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Contribution'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('pos', pos))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contribution &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(pos),
      const DeepCollectionEquality().hash(addedBy),
      const DeepCollectionEquality().hash(addedById));

  @JsonKey(ignore: true)
  @override
  _$$_ContributionCopyWith<_$_Contribution> get copyWith =>
      __$$_ContributionCopyWithImpl<_$_Contribution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContributionToJson(this);
  }
}

abstract class _Contribution implements Contribution {
  const factory _Contribution(
      {final int? id,
      final ContributionRole? role,
      final Content? content,
      @JsonKey(name: 'content_id', required: true) required final int contentId,
      final Entity? entity,
      @JsonKey(name: 'entity_id', required: true) required final int entityId,
      final int? pos,
      @JsonKey(name: 'added_by') final Entity? addedBy,
      @JsonKey(name: 'added_by_id') final int? addedById}) = _$_Contribution;

  factory _Contribution.fromJson(Map<String, dynamic> json) =
      _$_Contribution.fromJson;

  @override
  int? get id;
  @override

  /// (author, creator, speaker, host, guest, instructor)
  ContributionRole? get role;
  @override
  Content? get content;
  @override

  /// related content id
  @JsonKey(name: 'content_id', required: true)
  int get contentId;
  @override
  Entity? get entity;
  @override
  @JsonKey(name: 'entity_id', required: true)
  int get entityId;
  @override

  /// position of appearance
  int? get pos;
  @override // iki tane entity var ?
  /// Entity object (profile) who added the contribution
  @JsonKey(name: 'added_by')
  Entity? get addedBy;
  @override

  /// Entity object (profile) id who added the contribution
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  @JsonKey(ignore: true)
  _$$_ContributionCopyWith<_$_Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}
