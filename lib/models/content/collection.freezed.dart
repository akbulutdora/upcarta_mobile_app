// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return _Collection.fromJson(json);
}

/// @nodoc
mixin _$Collection {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id')
  int? get entityId => throw _privateConstructorUsedError;

  /// The entity that owns the collection
  Entity? get entity => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by')
  Entity? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  CollectionType get type => throw _privateConstructorUsedError;
  CollectionSort? get sort => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_accuracy')
  CollectionCreatedAtAccuracy? get createdAtAccuracy =>
      throw _privateConstructorUsedError; //todo: external ise required
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_content')
  Content? get sourceContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_content_id')
  int? get sourceContentId => throw _privateConstructorUsedError;
  CollectionVisibility? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt => throw _privateConstructorUsedError;
  bool? get recommended => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_topics')
  List<Topic>? get collectionTopics => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionCopyWith<Collection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionCopyWith<$Res> {
  factory $CollectionCopyWith(
          Collection value, $Res Function(Collection) then) =
      _$CollectionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      @JsonKey(name: 'entity_id')
          int? entityId,
      Entity? entity,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      String? description,
      String? slug,
      CollectionType type,
      CollectionSort? sort,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CollectionCreatedAtAccuracy? createdAtAccuracy,
      String? link,
      @JsonKey(name: 'source_content')
          Content? sourceContent,
      @JsonKey(name: 'source_content_id')
          int? sourceContentId,
      CollectionVisibility? visibility,
      @JsonKey(name: 'verified_at')
          DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          DateTime? featuredAt,
      bool? recommended,
      @JsonKey(name: 'published_at')
          DateTime? publishedAt,
      @JsonKey(name: 'collection_topics')
          List<Topic>? collectionTopics,
      @JsonKey(name: 'inserted_at')
          DateTime? insertedAt});

  $EntityCopyWith<$Res>? get entity;
  $EntityCopyWith<$Res>? get addedBy;
}

/// @nodoc
class _$CollectionCopyWithImpl<$Res> implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._value, this._then);

  final Collection _value;
  // ignore: unused_field
  final $Res Function(Collection) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? type = freezed,
    Object? sort = freezed,
    Object? createdAtStr = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? link = freezed,
    Object? sourceContent = freezed,
    Object? sourceContentId = freezed,
    Object? visibility = freezed,
    Object? verifiedAt = freezed,
    Object? featuredAt = freezed,
    Object? recommended = freezed,
    Object? publishedAt = freezed,
    Object? collectionTopics = freezed,
    Object? insertedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as CollectionSort?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CollectionCreatedAtAccuracy?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceContent: sourceContent == freezed
          ? _value.sourceContent
          : sourceContent // ignore: cast_nullable_to_non_nullable
              as Content?,
      sourceContentId: sourceContentId == freezed
          ? _value.sourceContentId
          : sourceContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as CollectionVisibility?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recommended: recommended == freezed
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as bool?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      collectionTopics: collectionTopics == freezed
          ? _value.collectionTopics
          : collectionTopics // ignore: cast_nullable_to_non_nullable
              as List<Topic>?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_CollectionCopyWith<$Res>
    implements $CollectionCopyWith<$Res> {
  factory _$$_CollectionCopyWith(
          _$_Collection value, $Res Function(_$_Collection) then) =
      __$$_CollectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      @JsonKey(name: 'entity_id')
          int? entityId,
      Entity? entity,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      String? description,
      String? slug,
      CollectionType type,
      CollectionSort? sort,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CollectionCreatedAtAccuracy? createdAtAccuracy,
      String? link,
      @JsonKey(name: 'source_content')
          Content? sourceContent,
      @JsonKey(name: 'source_content_id')
          int? sourceContentId,
      CollectionVisibility? visibility,
      @JsonKey(name: 'verified_at')
          DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          DateTime? featuredAt,
      bool? recommended,
      @JsonKey(name: 'published_at')
          DateTime? publishedAt,
      @JsonKey(name: 'collection_topics')
          List<Topic>? collectionTopics,
      @JsonKey(name: 'inserted_at')
          DateTime? insertedAt});

  @override
  $EntityCopyWith<$Res>? get entity;
  @override
  $EntityCopyWith<$Res>? get addedBy;
}

/// @nodoc
class __$$_CollectionCopyWithImpl<$Res> extends _$CollectionCopyWithImpl<$Res>
    implements _$$_CollectionCopyWith<$Res> {
  __$$_CollectionCopyWithImpl(
      _$_Collection _value, $Res Function(_$_Collection) _then)
      : super(_value, (v) => _then(v as _$_Collection));

  @override
  _$_Collection get _value => super._value as _$_Collection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? entityId = freezed,
    Object? entity = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? type = freezed,
    Object? sort = freezed,
    Object? createdAtStr = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? link = freezed,
    Object? sourceContent = freezed,
    Object? sourceContentId = freezed,
    Object? visibility = freezed,
    Object? verifiedAt = freezed,
    Object? featuredAt = freezed,
    Object? recommended = freezed,
    Object? publishedAt = freezed,
    Object? collectionTopics = freezed,
    Object? insertedAt = freezed,
  }) {
    return _then(_$_Collection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as CollectionSort?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CollectionCreatedAtAccuracy?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceContent: sourceContent == freezed
          ? _value.sourceContent
          : sourceContent // ignore: cast_nullable_to_non_nullable
              as Content?,
      sourceContentId: sourceContentId == freezed
          ? _value.sourceContentId
          : sourceContentId // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as CollectionVisibility?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recommended: recommended == freezed
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as bool?,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      collectionTopics: collectionTopics == freezed
          ? _value._collectionTopics
          : collectionTopics // ignore: cast_nullable_to_non_nullable
              as List<Topic>?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Collection with DiagnosticableTreeMixin implements _Collection {
  const _$_Collection(
      {this.id,
      required this.title,
      @JsonKey(name: 'entity_id') this.entityId,
      this.entity,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById,
      this.description,
      this.slug,
      required this.type,
      this.sort,
      @JsonKey(name: 'created_at_str') this.createdAtStr,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_at_accuracy') this.createdAtAccuracy,
      this.link,
      @JsonKey(name: 'source_content') this.sourceContent,
      @JsonKey(name: 'source_content_id') this.sourceContentId,
      this.visibility,
      @JsonKey(name: 'verified_at') this.verifiedAt,
      @JsonKey(name: 'featured_at') this.featuredAt,
      this.recommended,
      @JsonKey(name: 'published_at') this.publishedAt,
      @JsonKey(name: 'collection_topics') final List<Topic>? collectionTopics,
      @JsonKey(name: 'inserted_at') this.insertedAt})
      : _collectionTopics = collectionTopics;

  factory _$_Collection.fromJson(Map<String, dynamic> json) =>
      _$$_CollectionFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  @JsonKey(name: 'entity_id')
  final int? entityId;

  /// The entity that owns the collection
  @override
  final Entity? entity;
  @override
  @JsonKey(name: 'added_by')
  final Entity? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;
  @override
  final String? description;
  @override
  final String? slug;
  @override
  final CollectionType type;
  @override
  final CollectionSort? sort;
  @override
  @JsonKey(name: 'created_at_str')
  final String? createdAtStr;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  final CollectionCreatedAtAccuracy? createdAtAccuracy;
//todo: external ise required
  @override
  final String? link;
  @override
  @JsonKey(name: 'source_content')
  final Content? sourceContent;
  @override
  @JsonKey(name: 'source_content_id')
  final int? sourceContentId;
  @override
  final CollectionVisibility? visibility;
  @override
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;
  @override
  @JsonKey(name: 'featured_at')
  final DateTime? featuredAt;
  @override
  final bool? recommended;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  final List<Topic>? _collectionTopics;
  @override
  @JsonKey(name: 'collection_topics')
  List<Topic>? get collectionTopics {
    final value = _collectionTopics;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Collection(id: $id, title: $title, entityId: $entityId, entity: $entity, addedBy: $addedBy, addedById: $addedById, description: $description, slug: $slug, type: $type, sort: $sort, createdAtStr: $createdAtStr, createdAt: $createdAt, createdAtAccuracy: $createdAtAccuracy, link: $link, sourceContent: $sourceContent, sourceContentId: $sourceContentId, visibility: $visibility, verifiedAt: $verifiedAt, featuredAt: $featuredAt, recommended: $recommended, publishedAt: $publishedAt, collectionTopics: $collectionTopics, insertedAt: $insertedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Collection'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('entityId', entityId))
      ..add(DiagnosticsProperty('entity', entity))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('createdAtStr', createdAtStr))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdAtAccuracy', createdAtAccuracy))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('sourceContent', sourceContent))
      ..add(DiagnosticsProperty('sourceContentId', sourceContentId))
      ..add(DiagnosticsProperty('visibility', visibility))
      ..add(DiagnosticsProperty('verifiedAt', verifiedAt))
      ..add(DiagnosticsProperty('featuredAt', featuredAt))
      ..add(DiagnosticsProperty('recommended', recommended))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('collectionTopics', collectionTopics))
      ..add(DiagnosticsProperty('insertedAt', insertedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Collection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            const DeepCollectionEquality()
                .equals(other.createdAtStr, createdAtStr) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.createdAtAccuracy, createdAtAccuracy) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality()
                .equals(other.sourceContent, sourceContent) &&
            const DeepCollectionEquality()
                .equals(other.sourceContentId, sourceContentId) &&
            const DeepCollectionEquality()
                .equals(other.visibility, visibility) &&
            const DeepCollectionEquality()
                .equals(other.verifiedAt, verifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.featuredAt, featuredAt) &&
            const DeepCollectionEquality()
                .equals(other.recommended, recommended) &&
            const DeepCollectionEquality()
                .equals(other.publishedAt, publishedAt) &&
            const DeepCollectionEquality()
                .equals(other._collectionTopics, _collectionTopics) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(entityId),
        const DeepCollectionEquality().hash(entity),
        const DeepCollectionEquality().hash(addedBy),
        const DeepCollectionEquality().hash(addedById),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(sort),
        const DeepCollectionEquality().hash(createdAtStr),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(createdAtAccuracy),
        const DeepCollectionEquality().hash(link),
        const DeepCollectionEquality().hash(sourceContent),
        const DeepCollectionEquality().hash(sourceContentId),
        const DeepCollectionEquality().hash(visibility),
        const DeepCollectionEquality().hash(verifiedAt),
        const DeepCollectionEquality().hash(featuredAt),
        const DeepCollectionEquality().hash(recommended),
        const DeepCollectionEquality().hash(publishedAt),
        const DeepCollectionEquality().hash(_collectionTopics),
        const DeepCollectionEquality().hash(insertedAt)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_CollectionCopyWith<_$_Collection> get copyWith =>
      __$$_CollectionCopyWithImpl<_$_Collection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectionToJson(this);
  }
}

abstract class _Collection implements Collection {
  const factory _Collection(
      {final int? id,
      required final String title,
      @JsonKey(name: 'entity_id')
          final int? entityId,
      final Entity? entity,
      @JsonKey(name: 'added_by')
          final Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          final int? addedById,
      final String? description,
      final String? slug,
      required final CollectionType type,
      final CollectionSort? sort,
      @JsonKey(name: 'created_at_str')
          final String? createdAtStr,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          final CollectionCreatedAtAccuracy? createdAtAccuracy,
      final String? link,
      @JsonKey(name: 'source_content')
          final Content? sourceContent,
      @JsonKey(name: 'source_content_id')
          final int? sourceContentId,
      final CollectionVisibility? visibility,
      @JsonKey(name: 'verified_at')
          final DateTime? verifiedAt,
      @JsonKey(name: 'featured_at')
          final DateTime? featuredAt,
      final bool? recommended,
      @JsonKey(name: 'published_at')
          final DateTime? publishedAt,
      @JsonKey(name: 'collection_topics')
          final List<Topic>? collectionTopics,
      @JsonKey(name: 'inserted_at')
          final DateTime? insertedAt}) = _$_Collection;

  factory _Collection.fromJson(Map<String, dynamic> json) =
      _$_Collection.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'entity_id')
  int? get entityId;
  @override

  /// The entity that owns the collection
  Entity? get entity;
  @override
  @JsonKey(name: 'added_by')
  Entity? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  String? get description;
  @override
  String? get slug;
  @override
  CollectionType get type;
  @override
  CollectionSort? get sort;
  @override
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  CollectionCreatedAtAccuracy? get createdAtAccuracy;
  @override //todo: external ise required
  String? get link;
  @override
  @JsonKey(name: 'source_content')
  Content? get sourceContent;
  @override
  @JsonKey(name: 'source_content_id')
  int? get sourceContentId;
  @override
  CollectionVisibility? get visibility;
  @override
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @override
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt;
  @override
  bool? get recommended;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  @JsonKey(name: 'collection_topics')
  List<Topic>? get collectionTopics;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionCopyWith<_$_Collection> get copyWith =>
      throw _privateConstructorUsedError;
}
