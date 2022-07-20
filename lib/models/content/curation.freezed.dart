// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'curation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Curation _$CurationFromJson(Map<String, dynamic> json) {
  return _Curation.fromJson(json);
}

/// @nodoc
mixin _$Curation {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', required: true)
  int get entityId => throw _privateConstructorUsedError;
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_accuracy')
  CurationCreatedAtAccuracy? get createdAtAccuracy =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id', required: true)
  int get contentId => throw _privateConstructorUsedError;
  Content? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by')
  Entity? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;
  CurationType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'undecided_at')
  DateTime? get undecidedAt => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int? get pos => throw _privateConstructorUsedError; //semada cikarilmis
//@JsonKey(name: 'platform_id') int? platformId,
//Platform? platform,
  @JsonKey(name: 'collection_id')
  int? get collectionId => throw _privateConstructorUsedError;
  Collection? get collection => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_content_id')
  int? get sourceContentId =>
      throw _privateConstructorUsedError; //to do: birbirlerinin icinde olunca ne olacak
  @JsonKey(name: 'source_content')
  Content? get sourceContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurationCopyWith<Curation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurationCopyWith<$Res> {
  factory $CurationCopyWith(Curation value, $Res Function(Curation) then) =
      _$CurationCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true)
          int entityId,
      Entity? entity,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CurationCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      @JsonKey(name: 'content_id', required: true)
          int contentId,
      Content? content,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      CurationType type,
      @JsonKey(name: 'verified_at')
          DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          DateTime? featuredAt,
      @JsonKey(name: 'undecided_at')
          DateTime? undecidedAt,
      String? link,
      String? comment,
      int? pos,
      @JsonKey(name: 'collection_id')
          int? collectionId,
      Collection? collection,
      @JsonKey(name: 'source_content_id')
          int? sourceContentId,
      @JsonKey(name: 'source_content')
          Content? sourceContent});

  $EntityCopyWith<$Res>? get entity;
  $ContentCopyWith<$Res>? get content;
  $EntityCopyWith<$Res>? get addedBy;
  $CollectionCopyWith<$Res>? get collection;
  $ContentCopyWith<$Res>? get sourceContent;
}

/// @nodoc
class _$CurationCopyWithImpl<$Res> implements $CurationCopyWith<$Res> {
  _$CurationCopyWithImpl(this._value, this._then);

  final Curation _value;
  // ignore: unused_field
  final $Res Function(Curation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? contentId = freezed,
    Object? content = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? type = freezed,
    Object? verifiedAt = freezed,
    Object? featuredAt = freezed,
    Object? undecidedAt = freezed,
    Object? link = freezed,
    Object? comment = freezed,
    Object? pos = freezed,
    Object? collectionId = freezed,
    Object? collection = freezed,
    Object? sourceContentId = freezed,
    Object? sourceContent = freezed,
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CurationCreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurationType,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      undecidedAt: undecidedAt == freezed
          ? _value.undecidedAt
          : undecidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: collectionId == freezed
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      collection: collection == freezed
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection?,
      sourceContentId: sourceContentId == freezed
          ? _value.sourceContentId
          : sourceContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceContent: sourceContent == freezed
          ? _value.sourceContent
          : sourceContent // ignore: cast_nullable_to_non_nullable
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
  $EntityCopyWith<$Res>? get addedBy {
    if (_value.addedBy == null) {
      return null;
    }

    return $EntityCopyWith<$Res>(_value.addedBy!, (value) {
      return _then(_value.copyWith(addedBy: value));
    });
  }

  @override
  $CollectionCopyWith<$Res>? get collection {
    if (_value.collection == null) {
      return null;
    }

    return $CollectionCopyWith<$Res>(_value.collection!, (value) {
      return _then(_value.copyWith(collection: value));
    });
  }

  @override
  $ContentCopyWith<$Res>? get sourceContent {
    if (_value.sourceContent == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.sourceContent!, (value) {
      return _then(_value.copyWith(sourceContent: value));
    });
  }
}

/// @nodoc
abstract class _$$_CurationCopyWith<$Res> implements $CurationCopyWith<$Res> {
  factory _$$_CurationCopyWith(
          _$_Curation value, $Res Function(_$_Curation) then) =
      __$$_CurationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'entity_id', required: true)
          int entityId,
      Entity? entity,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CurationCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      @JsonKey(name: 'content_id', required: true)
          int contentId,
      Content? content,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      CurationType type,
      @JsonKey(name: 'verified_at')
          DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          DateTime? featuredAt,
      @JsonKey(name: 'undecided_at')
          DateTime? undecidedAt,
      String? link,
      String? comment,
      int? pos,
      @JsonKey(name: 'collection_id')
          int? collectionId,
      Collection? collection,
      @JsonKey(name: 'source_content_id')
          int? sourceContentId,
      @JsonKey(name: 'source_content')
          Content? sourceContent});

  @override
  $EntityCopyWith<$Res>? get entity;
  @override
  $ContentCopyWith<$Res>? get content;
  @override
  $EntityCopyWith<$Res>? get addedBy;
  @override
  $CollectionCopyWith<$Res>? get collection;
  @override
  $ContentCopyWith<$Res>? get sourceContent;
}

/// @nodoc
class __$$_CurationCopyWithImpl<$Res> extends _$CurationCopyWithImpl<$Res>
    implements _$$_CurationCopyWith<$Res> {
  __$$_CurationCopyWithImpl(
      _$_Curation _value, $Res Function(_$_Curation) _then)
      : super(_value, (v) => _then(v as _$_Curation));

  @override
  _$_Curation get _value => super._value as _$_Curation;

  @override
  $Res call({
    Object? id = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? contentId = freezed,
    Object? content = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? type = freezed,
    Object? verifiedAt = freezed,
    Object? featuredAt = freezed,
    Object? undecidedAt = freezed,
    Object? link = freezed,
    Object? comment = freezed,
    Object? pos = freezed,
    Object? collectionId = freezed,
    Object? collection = freezed,
    Object? sourceContentId = freezed,
    Object? sourceContent = freezed,
  }) {
    return _then(_$_Curation(
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
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CurationCreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurationType,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      undecidedAt: undecidedAt == freezed
          ? _value.undecidedAt
          : undecidedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      collectionId: collectionId == freezed
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      collection: collection == freezed
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection?,
      sourceContentId: sourceContentId == freezed
          ? _value.sourceContentId
          : sourceContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceContent: sourceContent == freezed
          ? _value.sourceContent
          : sourceContent // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Curation with DiagnosticableTreeMixin implements _Curation {
  const _$_Curation(
      {this.id,
      @JsonKey(name: 'entity_id', required: true) required this.entityId,
      this.entity,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_at_accuracy') this.createdAtAccuracy,
      @JsonKey(name: 'created_at_str') this.createdAtStr,
      @JsonKey(name: 'content_id', required: true) required this.contentId,
      this.content,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById,
      required this.type,
      @JsonKey(name: 'verified_at') this.verifiedAt,
      @JsonKey(name: 'featured_at') this.featuredAt,
      @JsonKey(name: 'undecided_at') this.undecidedAt,
      this.link,
      this.comment,
      this.pos,
      @JsonKey(name: 'collection_id') this.collectionId,
      this.collection,
      @JsonKey(name: 'source_content_id') this.sourceContentId,
      @JsonKey(name: 'source_content') this.sourceContent});

  factory _$_Curation.fromJson(Map<String, dynamic> json) =>
      _$$_CurationFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  final int entityId;
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  final CurationCreatedAtAccuracy? createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  final String? createdAtStr;
  @override
  @JsonKey(name: 'content_id', required: true)
  final int contentId;
  @override
  final Content? content;
  @override
  @JsonKey(name: 'added_by')
  final Entity? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;
  @override
  final CurationType type;
  @override
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;
  @override
  @JsonKey(name: 'featured_at')
  final DateTime? featuredAt;
  @override
  @JsonKey(name: 'undecided_at')
  final DateTime? undecidedAt;
  @override
  final String? link;
  @override
  final String? comment;
  @override
  final int? pos;
//semada cikarilmis
//@JsonKey(name: 'platform_id') int? platformId,
//Platform? platform,
  @override
  @JsonKey(name: 'collection_id')
  final int? collectionId;
  @override
  final Collection? collection;
  @override
  @JsonKey(name: 'source_content_id')
  final int? sourceContentId;
//to do: birbirlerinin icinde olunca ne olacak
  @override
  @JsonKey(name: 'source_content')
  final Content? sourceContent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Curation(id: $id, entityId: $entityId, entity: $entity, createdAt: $createdAt, createdAtAccuracy: $createdAtAccuracy, createdAtStr: $createdAtStr, contentId: $contentId, content: $content, addedBy: $addedBy, addedById: $addedById, type: $type, verifiedAt: $verifiedAt, featuredAt: $featuredAt, undecidedAt: $undecidedAt, link: $link, comment: $comment, pos: $pos, collectionId: $collectionId, collection: $collection, sourceContentId: $sourceContentId, sourceContent: $sourceContent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Curation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdAtAccuracy', createdAtAccuracy))
      ..add(DiagnosticsProperty('createdAtStr', createdAtStr))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('verifiedAt', verifiedAt))
      ..add(DiagnosticsProperty('featuredAt', featuredAt))
      ..add(DiagnosticsProperty('undecidedAt', undecidedAt))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('pos', pos))
      ..add(DiagnosticsProperty('collectionId', collectionId))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('sourceContentId', sourceContentId))
      ..add(DiagnosticsProperty('sourceContent', sourceContent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Curation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.createdAtAccuracy, createdAtAccuracy) &&
            const DeepCollectionEquality()
                .equals(other.createdAtStr, createdAtStr) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.verifiedAt, verifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.featuredAt, featuredAt) &&
            const DeepCollectionEquality()
                .equals(other.undecidedAt, undecidedAt) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality()
                .equals(other.collectionId, collectionId) &&
            const DeepCollectionEquality()
                .equals(other.collection, collection) &&
            const DeepCollectionEquality()
                .equals(other.sourceContentId, sourceContentId) &&
            const DeepCollectionEquality()
                .equals(other.sourceContent, sourceContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(entityId),
        const DeepCollectionEquality().hash(entity),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(createdAtAccuracy),
        const DeepCollectionEquality().hash(createdAtStr),
        const DeepCollectionEquality().hash(contentId),
        const DeepCollectionEquality().hash(content),
        const DeepCollectionEquality().hash(addedBy),
        const DeepCollectionEquality().hash(addedById),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(verifiedAt),
        const DeepCollectionEquality().hash(featuredAt),
        const DeepCollectionEquality().hash(undecidedAt),
        const DeepCollectionEquality().hash(link),
        const DeepCollectionEquality().hash(comment),
        const DeepCollectionEquality().hash(pos),
        const DeepCollectionEquality().hash(collectionId),
        const DeepCollectionEquality().hash(collection),
        const DeepCollectionEquality().hash(sourceContentId),
        const DeepCollectionEquality().hash(sourceContent)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_CurationCopyWith<_$_Curation> get copyWith =>
      __$$_CurationCopyWithImpl<_$_Curation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurationToJson(this);
  }
}

abstract class _Curation implements Curation {
  const factory _Curation(
      {final int? id,
      @JsonKey(name: 'entity_id', required: true)
          required final int entityId,
      final Entity? entity,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          final CurationCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          final String? createdAtStr,
      @JsonKey(name: 'content_id', required: true)
          required final int contentId,
      final Content? content,
      @JsonKey(name: 'added_by')
          final Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          final int? addedById,
      required final CurationType type,
      @JsonKey(name: 'verified_at')
          final DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          final DateTime? featuredAt,
      @JsonKey(name: 'undecided_at')
          final DateTime? undecidedAt,
      final String? link,
      final String? comment,
      final int? pos,
      @JsonKey(name: 'collection_id')
          final int? collectionId,
      final Collection? collection,
      @JsonKey(name: 'source_content_id')
          final int? sourceContentId,
      @JsonKey(name: 'source_content')
          final Content? sourceContent}) = _$_Curation;

  factory _Curation.fromJson(Map<String, dynamic> json) = _$_Curation.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'entity_id', required: true)
  int get entityId;
  @override
  Entity? get entity;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  CurationCreatedAtAccuracy? get createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr;
  @override
  @JsonKey(name: 'content_id', required: true)
  int get contentId;
  @override
  Content? get content;
  @override
  @JsonKey(name: 'added_by')
  Entity? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  CurationType get type;
  @override
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @override
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt;
  @override
  @JsonKey(name: 'undecided_at')
  DateTime? get undecidedAt;
  @override
  String? get link;
  @override
  String? get comment;
  @override
  int? get pos;
  @override //semada cikarilmis
//@JsonKey(name: 'platform_id') int? platformId,
//Platform? platform,
  @JsonKey(name: 'collection_id')
  int? get collectionId;
  @override
  Collection? get collection;
  @override
  @JsonKey(name: 'source_content_id')
  int? get sourceContentId;
  @override //to do: birbirlerinin icinde olunca ne olacak
  @JsonKey(name: 'source_content')
  Content? get sourceContent;
  @override
  @JsonKey(ignore: true)
  _$$_CurationCopyWith<_$_Curation> get copyWith =>
      throw _privateConstructorUsedError;
}
