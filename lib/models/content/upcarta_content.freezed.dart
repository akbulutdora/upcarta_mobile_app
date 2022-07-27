// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcarta_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  ContentType? get type =>
      throw _privateConstructorUsedError; // todo : content content mi tutacak bunu pointer ile yapmak gerekmez mi
  Content? get parent => throw _privateConstructorUsedError;
  List<Content>? get children =>
      throw _privateConstructorUsedError; // yeni dokumantasyonda yok content details silindi
// ContentDetails? details,
// obje olarak addedBy da ne tutuluyor sadece isim mi user mı ?
  @JsonKey(name: 'added_by')
  Entity? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_topics')
  List<ContentTopic>? get contentTopics => throw _privateConstructorUsedError;
  List<Contribution>? get contributions =>
      throw _privateConstructorUsedError; // content linkler string olucak onlari string olarak mi sakliyoruz
// TODO : * at least one link is required
// liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
  @JsonKey(name: 'content_links', required: true)
  List<ContentLink> get contentLinks => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_links_count')
  int? get contentLinksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommenders_count')
  int? get recommendersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_collections_count')
  int? get publicCollectionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_recommenders_count')
  int? get featuredRecommendersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'context_recommenders_count')
  int? get contextRecommendersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_accuracy')
  CreatedAtAccuracy? get createdAtAccuracy =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr => throw _privateConstructorUsedError;
  bool? get followable => throw _privateConstructorUsedError;
  @JsonKey(name: 'personal_curations')
  List<Curation>? get personalCurations => throw _privateConstructorUsedError;
  @JsonKey(name: 'personal_collections')
  List<Collection>? get personalCollections =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'content_following')
  User? get contentFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      String? description,
      String? slug,
      ContentType? type,
      Content? parent,
      List<Content>? children,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      @JsonKey(name: 'content_topics')
          List<ContentTopic>? contentTopics,
      List<Contribution>? contributions,
      @JsonKey(name: 'content_links', required: true)
          List<ContentLink> contentLinks,
      @JsonKey(name: 'content_links_count')
          int? contentLinksCount,
      @JsonKey(name: 'recommenders_count')
          int? recommendersCount,
      @JsonKey(name: 'followers_count')
          int? followersCount,
      @JsonKey(name: 'public_collections_count')
          int? publicCollectionsCount,
      @JsonKey(name: 'featured_recommenders_count')
          int? featuredRecommendersCount,
      @JsonKey(name: 'context_recommenders_count')
          int? contextRecommendersCount,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      bool? followable,
      @JsonKey(name: 'personal_curations')
          List<Curation>? personalCurations,
      @JsonKey(name: 'personal_collections')
          List<Collection>? personalCollections,
      @JsonKey(name: 'content_following')
          User? contentFollowing,
      @JsonKey(name: 'inserted_at')
          DateTime? insertedAt});

  $ContentCopyWith<$Res>? get parent;
  $EntityCopyWith<$Res>? get addedBy;
  $UserCopyWith<$Res>? get contentFollowing;
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? type = freezed,
    Object? parent = freezed,
    Object? children = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? contentTopics = freezed,
    Object? contributions = freezed,
    Object? contentLinks = freezed,
    Object? contentLinksCount = freezed,
    Object? recommendersCount = freezed,
    Object? followersCount = freezed,
    Object? publicCollectionsCount = freezed,
    Object? featuredRecommendersCount = freezed,
    Object? contextRecommendersCount = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? followable = freezed,
    Object? personalCurations = freezed,
    Object? personalCollections = freezed,
    Object? contentFollowing = freezed,
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
              as ContentType?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Content?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      contentTopics: contentTopics == freezed
          ? _value.contentTopics
          : contentTopics // ignore: cast_nullable_to_non_nullable
              as List<ContentTopic>?,
      contributions: contributions == freezed
          ? _value.contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<Contribution>?,
      contentLinks: contentLinks == freezed
          ? _value.contentLinks
          : contentLinks // ignore: cast_nullable_to_non_nullable
              as List<ContentLink>,
      contentLinksCount: contentLinksCount == freezed
          ? _value.contentLinksCount
          : contentLinksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendersCount: recommendersCount == freezed
          ? _value.recommendersCount
          : recommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publicCollectionsCount: publicCollectionsCount == freezed
          ? _value.publicCollectionsCount
          : publicCollectionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      featuredRecommendersCount: featuredRecommendersCount == freezed
          ? _value.featuredRecommendersCount
          : featuredRecommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      contextRecommendersCount: contextRecommendersCount == freezed
          ? _value.contextRecommendersCount
          : contextRecommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      followable: followable == freezed
          ? _value.followable
          : followable // ignore: cast_nullable_to_non_nullable
              as bool?,
      personalCurations: personalCurations == freezed
          ? _value.personalCurations
          : personalCurations // ignore: cast_nullable_to_non_nullable
              as List<Curation>?,
      personalCollections: personalCollections == freezed
          ? _value.personalCollections
          : personalCollections // ignore: cast_nullable_to_non_nullable
              as List<Collection>?,
      contentFollowing: contentFollowing == freezed
          ? _value.contentFollowing
          : contentFollowing // ignore: cast_nullable_to_non_nullable
              as User?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $ContentCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value));
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
  $UserCopyWith<$Res>? get contentFollowing {
    if (_value.contentFollowing == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.contentFollowing!, (value) {
      return _then(_value.copyWith(contentFollowing: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$_ContentCopyWith(
          _$_Content value, $Res Function(_$_Content) then) =
      __$$_ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      String? description,
      String? slug,
      ContentType? type,
      Content? parent,
      List<Content>? children,
      @JsonKey(name: 'added_by')
          Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          int? addedById,
      @JsonKey(name: 'content_topics')
          List<ContentTopic>? contentTopics,
      List<Contribution>? contributions,
      @JsonKey(name: 'content_links', required: true)
          List<ContentLink> contentLinks,
      @JsonKey(name: 'content_links_count')
          int? contentLinksCount,
      @JsonKey(name: 'recommenders_count')
          int? recommendersCount,
      @JsonKey(name: 'followers_count')
          int? followersCount,
      @JsonKey(name: 'public_collections_count')
          int? publicCollectionsCount,
      @JsonKey(name: 'featured_recommenders_count')
          int? featuredRecommendersCount,
      @JsonKey(name: 'context_recommenders_count')
          int? contextRecommendersCount,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          CreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      bool? followable,
      @JsonKey(name: 'personal_curations')
          List<Curation>? personalCurations,
      @JsonKey(name: 'personal_collections')
          List<Collection>? personalCollections,
      @JsonKey(name: 'content_following')
          User? contentFollowing,
      @JsonKey(name: 'inserted_at')
          DateTime? insertedAt});

  @override
  $ContentCopyWith<$Res>? get parent;
  @override
  $EntityCopyWith<$Res>? get addedBy;
  @override
  $UserCopyWith<$Res>? get contentFollowing;
}

/// @nodoc
class __$$_ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res>
    implements _$$_ContentCopyWith<$Res> {
  __$$_ContentCopyWithImpl(_$_Content _value, $Res Function(_$_Content) _then)
      : super(_value, (v) => _then(v as _$_Content));

  @override
  _$_Content get _value => super._value as _$_Content;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? type = freezed,
    Object? parent = freezed,
    Object? children = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? contentTopics = freezed,
    Object? contributions = freezed,
    Object? contentLinks = freezed,
    Object? contentLinksCount = freezed,
    Object? recommendersCount = freezed,
    Object? followersCount = freezed,
    Object? publicCollectionsCount = freezed,
    Object? featuredRecommendersCount = freezed,
    Object? contextRecommendersCount = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? followable = freezed,
    Object? personalCurations = freezed,
    Object? personalCollections = freezed,
    Object? contentFollowing = freezed,
    Object? insertedAt = freezed,
  }) {
    return _then(_$_Content(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
              as ContentType?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Content?,
      children: children == freezed
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      contentTopics: contentTopics == freezed
          ? _value._contentTopics
          : contentTopics // ignore: cast_nullable_to_non_nullable
              as List<ContentTopic>?,
      contributions: contributions == freezed
          ? _value._contributions
          : contributions // ignore: cast_nullable_to_non_nullable
              as List<Contribution>?,
      contentLinks: contentLinks == freezed
          ? _value._contentLinks
          : contentLinks // ignore: cast_nullable_to_non_nullable
              as List<ContentLink>,
      contentLinksCount: contentLinksCount == freezed
          ? _value.contentLinksCount
          : contentLinksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendersCount: recommendersCount == freezed
          ? _value.recommendersCount
          : recommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      publicCollectionsCount: publicCollectionsCount == freezed
          ? _value.publicCollectionsCount
          : publicCollectionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      featuredRecommendersCount: featuredRecommendersCount == freezed
          ? _value.featuredRecommendersCount
          : featuredRecommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      contextRecommendersCount: contextRecommendersCount == freezed
          ? _value.contextRecommendersCount
          : contextRecommendersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as CreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      followable: followable == freezed
          ? _value.followable
          : followable // ignore: cast_nullable_to_non_nullable
              as bool?,
      personalCurations: personalCurations == freezed
          ? _value._personalCurations
          : personalCurations // ignore: cast_nullable_to_non_nullable
              as List<Curation>?,
      personalCollections: personalCollections == freezed
          ? _value._personalCollections
          : personalCollections // ignore: cast_nullable_to_non_nullable
              as List<Collection>?,
      contentFollowing: contentFollowing == freezed
          ? _value.contentFollowing
          : contentFollowing // ignore: cast_nullable_to_non_nullable
              as User?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content with DiagnosticableTreeMixin implements _Content {
  const _$_Content(
      {this.id,
      required this.title,
      this.description,
      this.slug,
      this.type,
      this.parent,
      final List<Content>? children,
      @JsonKey(name: 'added_by')
          this.addedBy,
      @JsonKey(name: 'added_by_id')
          this.addedById,
      @JsonKey(name: 'content_topics')
          final List<ContentTopic>? contentTopics,
      final List<Contribution>? contributions,
      @JsonKey(name: 'content_links', required: true)
          required final List<ContentLink> contentLinks,
      @JsonKey(name: 'content_links_count')
          this.contentLinksCount,
      @JsonKey(name: 'recommenders_count')
          this.recommendersCount,
      @JsonKey(name: 'followers_count')
          this.followersCount,
      @JsonKey(name: 'public_collections_count')
          this.publicCollectionsCount,
      @JsonKey(name: 'featured_recommenders_count')
          this.featuredRecommendersCount,
      @JsonKey(name: 'context_recommenders_count')
          this.contextRecommendersCount,
      @JsonKey(name: 'created_at')
          this.createdAt,
      @JsonKey(name: 'created_at_accuracy')
          this.createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          this.createdAtStr,
      this.followable,
      @JsonKey(name: 'personal_curations')
          final List<Curation>? personalCurations,
      @JsonKey(name: 'personal_collections')
          final List<Collection>? personalCollections,
      @JsonKey(name: 'content_following')
          this.contentFollowing,
      @JsonKey(name: 'inserted_at')
          this.insertedAt})
      : _children = children,
        _contentTopics = contentTopics,
        _contributions = contributions,
        _contentLinks = contentLinks,
        _personalCurations = personalCurations,
        _personalCollections = personalCollections;

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$$_ContentFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? slug;
  @override
  final ContentType? type;
// todo : content content mi tutacak bunu pointer ile yapmak gerekmez mi
  @override
  final Content? parent;
  final List<Content>? _children;
  @override
  List<Content>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// yeni dokumantasyonda yok content details silindi
// ContentDetails? details,
// obje olarak addedBy da ne tutuluyor sadece isim mi user mı ?
  @override
  @JsonKey(name: 'added_by')
  final Entity? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;
  final List<ContentTopic>? _contentTopics;
  @override
  @JsonKey(name: 'content_topics')
  List<ContentTopic>? get contentTopics {
    final value = _contentTopics;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Contribution>? _contributions;
  @override
  List<Contribution>? get contributions {
    final value = _contributions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// content linkler string olucak onlari string olarak mi sakliyoruz
// TODO : * at least one link is required
// liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
  final List<ContentLink> _contentLinks;
// content linkler string olucak onlari string olarak mi sakliyoruz
// TODO : * at least one link is required
// liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
  @override
  @JsonKey(name: 'content_links', required: true)
  List<ContentLink> get contentLinks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentLinks);
  }

  @override
  @JsonKey(name: 'content_links_count')
  final int? contentLinksCount;
  @override
  @JsonKey(name: 'recommenders_count')
  final int? recommendersCount;
  @override
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @JsonKey(name: 'public_collections_count')
  final int? publicCollectionsCount;
  @override
  @JsonKey(name: 'featured_recommenders_count')
  final int? featuredRecommendersCount;
  @override
  @JsonKey(name: 'context_recommenders_count')
  final int? contextRecommendersCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  final CreatedAtAccuracy? createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  final String? createdAtStr;
  @override
  final bool? followable;
  final List<Curation>? _personalCurations;
  @override
  @JsonKey(name: 'personal_curations')
  List<Curation>? get personalCurations {
    final value = _personalCurations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Collection>? _personalCollections;
  @override
  @JsonKey(name: 'personal_collections')
  List<Collection>? get personalCollections {
    final value = _personalCollections;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'content_following')
  final User? contentFollowing;
  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Content(id: $id, title: $title, description: $description, slug: $slug, type: $type, parent: $parent, children: $children, addedBy: $addedBy, addedById: $addedById, contentTopics: $contentTopics, contributions: $contributions, contentLinks: $contentLinks, contentLinksCount: $contentLinksCount, recommendersCount: $recommendersCount, followersCount: $followersCount, publicCollectionsCount: $publicCollectionsCount, featuredRecommendersCount: $featuredRecommendersCount, contextRecommendersCount: $contextRecommendersCount, createdAt: $createdAt, createdAtAccuracy: $createdAtAccuracy, createdAtStr: $createdAtStr, followable: $followable, personalCurations: $personalCurations, personalCollections: $personalCollections, contentFollowing: $contentFollowing, insertedAt: $insertedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Content'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('parent', parent))
      ..add(DiagnosticsProperty('children', children))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('contentTopics', contentTopics))
      ..add(DiagnosticsProperty('contributions', contributions))
      ..add(DiagnosticsProperty('contentLinks', contentLinks))
      ..add(DiagnosticsProperty('contentLinksCount', contentLinksCount))
      ..add(DiagnosticsProperty('recommendersCount', recommendersCount))
      ..add(DiagnosticsProperty('followersCount', followersCount))
      ..add(
          DiagnosticsProperty('publicCollectionsCount', publicCollectionsCount))
      ..add(DiagnosticsProperty(
          'featuredRecommendersCount', featuredRecommendersCount))
      ..add(DiagnosticsProperty(
          'contextRecommendersCount', contextRecommendersCount))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdAtAccuracy', createdAtAccuracy))
      ..add(DiagnosticsProperty('createdAtStr', createdAtStr))
      ..add(DiagnosticsProperty('followable', followable))
      ..add(DiagnosticsProperty('personalCurations', personalCurations))
      ..add(DiagnosticsProperty('personalCollections', personalCollections))
      ..add(DiagnosticsProperty('contentFollowing', contentFollowing))
      ..add(DiagnosticsProperty('insertedAt', insertedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Content &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality()
                .equals(other._contentTopics, _contentTopics) &&
            const DeepCollectionEquality()
                .equals(other._contributions, _contributions) &&
            const DeepCollectionEquality()
                .equals(other._contentLinks, _contentLinks) &&
            const DeepCollectionEquality()
                .equals(other.contentLinksCount, contentLinksCount) &&
            const DeepCollectionEquality()
                .equals(other.recommendersCount, recommendersCount) &&
            const DeepCollectionEquality()
                .equals(other.followersCount, followersCount) &&
            const DeepCollectionEquality()
                .equals(other.publicCollectionsCount, publicCollectionsCount) &&
            const DeepCollectionEquality().equals(
                other.featuredRecommendersCount, featuredRecommendersCount) &&
            const DeepCollectionEquality().equals(
                other.contextRecommendersCount, contextRecommendersCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.createdAtAccuracy, createdAtAccuracy) &&
            const DeepCollectionEquality()
                .equals(other.createdAtStr, createdAtStr) &&
            const DeepCollectionEquality()
                .equals(other.followable, followable) &&
            const DeepCollectionEquality()
                .equals(other._personalCurations, _personalCurations) &&
            const DeepCollectionEquality()
                .equals(other._personalCollections, _personalCollections) &&
            const DeepCollectionEquality()
                .equals(other.contentFollowing, contentFollowing) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(parent),
        const DeepCollectionEquality().hash(_children),
        const DeepCollectionEquality().hash(addedBy),
        const DeepCollectionEquality().hash(addedById),
        const DeepCollectionEquality().hash(_contentTopics),
        const DeepCollectionEquality().hash(_contributions),
        const DeepCollectionEquality().hash(_contentLinks),
        const DeepCollectionEquality().hash(contentLinksCount),
        const DeepCollectionEquality().hash(recommendersCount),
        const DeepCollectionEquality().hash(followersCount),
        const DeepCollectionEquality().hash(publicCollectionsCount),
        const DeepCollectionEquality().hash(featuredRecommendersCount),
        const DeepCollectionEquality().hash(contextRecommendersCount),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(createdAtAccuracy),
        const DeepCollectionEquality().hash(createdAtStr),
        const DeepCollectionEquality().hash(followable),
        const DeepCollectionEquality().hash(_personalCurations),
        const DeepCollectionEquality().hash(_personalCollections),
        const DeepCollectionEquality().hash(contentFollowing),
        const DeepCollectionEquality().hash(insertedAt)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      __$$_ContentCopyWithImpl<_$_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentToJson(this);
  }
}

abstract class _Content implements Content {
  const factory _Content(
      {final int? id,
      required final String title,
      final String? description,
      final String? slug,
      final ContentType? type,
      final Content? parent,
      final List<Content>? children,
      @JsonKey(name: 'added_by')
          final Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          final int? addedById,
      @JsonKey(name: 'content_topics')
          final List<ContentTopic>? contentTopics,
      final List<Contribution>? contributions,
      @JsonKey(name: 'content_links', required: true)
          required final List<ContentLink> contentLinks,
      @JsonKey(name: 'content_links_count')
          final int? contentLinksCount,
      @JsonKey(name: 'recommenders_count')
          final int? recommendersCount,
      @JsonKey(name: 'followers_count')
          final int? followersCount,
      @JsonKey(name: 'public_collections_count')
          final int? publicCollectionsCount,
      @JsonKey(name: 'featured_recommenders_count')
          final int? featuredRecommendersCount,
      @JsonKey(name: 'context_recommenders_count')
          final int? contextRecommendersCount,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          final CreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          final String? createdAtStr,
      final bool? followable,
      @JsonKey(name: 'personal_curations')
          final List<Curation>? personalCurations,
      @JsonKey(name: 'personal_collections')
          final List<Collection>? personalCollections,
      @JsonKey(name: 'content_following')
          final User? contentFollowing,
      @JsonKey(name: 'inserted_at')
          final DateTime? insertedAt}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get slug;
  @override
  ContentType? get type;
  @override // todo : content content mi tutacak bunu pointer ile yapmak gerekmez mi
  Content? get parent;
  @override
  List<Content>? get children;
  @override // yeni dokumantasyonda yok content details silindi
// ContentDetails? details,
// obje olarak addedBy da ne tutuluyor sadece isim mi user mı ?
  @JsonKey(name: 'added_by')
  Entity? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  @JsonKey(name: 'content_topics')
  List<ContentTopic>? get contentTopics;
  @override
  List<Contribution>? get contributions;
  @override // content linkler string olucak onlari string olarak mi sakliyoruz
// TODO : * at least one link is required
// liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
  @JsonKey(name: 'content_links', required: true)
  List<ContentLink> get contentLinks;
  @override
  @JsonKey(name: 'content_links_count')
  int? get contentLinksCount;
  @override
  @JsonKey(name: 'recommenders_count')
  int? get recommendersCount;
  @override
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @JsonKey(name: 'public_collections_count')
  int? get publicCollectionsCount;
  @override
  @JsonKey(name: 'featured_recommenders_count')
  int? get featuredRecommendersCount;
  @override
  @JsonKey(name: 'context_recommenders_count')
  int? get contextRecommendersCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  CreatedAtAccuracy? get createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr;
  @override
  bool? get followable;
  @override
  @JsonKey(name: 'personal_curations')
  List<Curation>? get personalCurations;
  @override
  @JsonKey(name: 'personal_collections')
  List<Collection>? get personalCollections;
  @override
  @JsonKey(name: 'content_following')
  User? get contentFollowing;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
