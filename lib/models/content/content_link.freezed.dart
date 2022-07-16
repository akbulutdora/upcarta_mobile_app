// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentLink _$ContentLinkFromJson(Map<String, dynamic> json) {
  return _ContentLink.fromJson(json);
}

/// @nodoc
mixin _$ContentLink {
  int? get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_id')
  String? get sourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'alt_source_id')
  String? get altSourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_id')
  int? get platformId => throw _privateConstructorUsedError;
  Platform? get platform => throw _privateConstructorUsedError;
  LinkType? get type => throw _privateConstructorUsedError;
  Content? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id')
  int? get contentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_accuracy')
  ContentLinkCreatedAtAccuracy? get createdAtAccuracy =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr => throw _privateConstructorUsedError;
  int? get pos => throw _privateConstructorUsedError;
  @JsonKey(name: 'synced_at')
  DateTime? get syncedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentLinkCopyWith<ContentLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentLinkCopyWith<$Res> {
  factory $ContentLinkCopyWith(
          ContentLink value, $Res Function(ContentLink) then) =
      _$ContentLinkCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String link,
      String? title,
      String? description,
      String? slug,
      @JsonKey(name: 'status_code')
          int? statusCode,
      @JsonKey(name: 'source_id')
          String? sourceId,
      @JsonKey(name: 'alt_source_id')
          String? altSourceId,
      @JsonKey(name: 'platform_id')
          int? platformId,
      Platform? platform,
      LinkType? type,
      Content? content,
      @JsonKey(name: 'content_id')
          int? contentId,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          ContentLinkCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      int? pos,
      @JsonKey(name: 'synced_at')
          DateTime? syncedAt});

  $PlatformCopyWith<$Res>? get platform;
  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$ContentLinkCopyWithImpl<$Res> implements $ContentLinkCopyWith<$Res> {
  _$ContentLinkCopyWithImpl(this._value, this._then);

  final ContentLink _value;
  // ignore: unused_field
  final $Res Function(ContentLink) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? statusCode = freezed,
    Object? sourceId = freezed,
    Object? altSourceId = freezed,
    Object? platformId = freezed,
    Object? platform = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? pos = freezed,
    Object? syncedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceId: sourceId == freezed
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      altSourceId: altSourceId == freezed
          ? _value.altSourceId
          : altSourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      platformId: platformId == freezed
          ? _value.platformId
          : platformId // ignore: cast_nullable_to_non_nullable
              as int?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as ContentLinkCreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedAt: syncedAt == freezed
          ? _value.syncedAt
          : syncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $PlatformCopyWith<$Res>? get platform {
    if (_value.platform == null) {
      return null;
    }

    return $PlatformCopyWith<$Res>(_value.platform!, (value) {
      return _then(_value.copyWith(platform: value));
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
}

/// @nodoc
abstract class _$$_ContentLinkCopyWith<$Res>
    implements $ContentLinkCopyWith<$Res> {
  factory _$$_ContentLinkCopyWith(
          _$_ContentLink value, $Res Function(_$_ContentLink) then) =
      __$$_ContentLinkCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String link,
      String? title,
      String? description,
      String? slug,
      @JsonKey(name: 'status_code')
          int? statusCode,
      @JsonKey(name: 'source_id')
          String? sourceId,
      @JsonKey(name: 'alt_source_id')
          String? altSourceId,
      @JsonKey(name: 'platform_id')
          int? platformId,
      Platform? platform,
      LinkType? type,
      Content? content,
      @JsonKey(name: 'content_id')
          int? contentId,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          ContentLinkCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          String? createdAtStr,
      int? pos,
      @JsonKey(name: 'synced_at')
          DateTime? syncedAt});

  @override
  $PlatformCopyWith<$Res>? get platform;
  @override
  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$_ContentLinkCopyWithImpl<$Res> extends _$ContentLinkCopyWithImpl<$Res>
    implements _$$_ContentLinkCopyWith<$Res> {
  __$$_ContentLinkCopyWithImpl(
      _$_ContentLink _value, $Res Function(_$_ContentLink) _then)
      : super(_value, (v) => _then(v as _$_ContentLink));

  @override
  _$_ContentLink get _value => super._value as _$_ContentLink;

  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? slug = freezed,
    Object? statusCode = freezed,
    Object? sourceId = freezed,
    Object? altSourceId = freezed,
    Object? platformId = freezed,
    Object? platform = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? createdAt = freezed,
    Object? createdAtAccuracy = freezed,
    Object? createdAtStr = freezed,
    Object? pos = freezed,
    Object? syncedAt = freezed,
  }) {
    return _then(_$_ContentLink(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceId: sourceId == freezed
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      altSourceId: altSourceId == freezed
          ? _value.altSourceId
          : altSourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      platformId: platformId == freezed
          ? _value.platformId
          : platformId // ignore: cast_nullable_to_non_nullable
              as int?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LinkType?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAtAccuracy: createdAtAccuracy == freezed
          ? _value.createdAtAccuracy
          : createdAtAccuracy // ignore: cast_nullable_to_non_nullable
              as ContentLinkCreatedAtAccuracy?,
      createdAtStr: createdAtStr == freezed
          ? _value.createdAtStr
          : createdAtStr // ignore: cast_nullable_to_non_nullable
              as String?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      syncedAt: syncedAt == freezed
          ? _value.syncedAt
          : syncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentLink with DiagnosticableTreeMixin implements _ContentLink {
  const _$_ContentLink(
      {this.id,
      required this.link,
      this.title,
      this.description,
      this.slug,
      @JsonKey(name: 'status_code') this.statusCode,
      @JsonKey(name: 'source_id') this.sourceId,
      @JsonKey(name: 'alt_source_id') this.altSourceId,
      @JsonKey(name: 'platform_id') this.platformId,
      this.platform,
      this.type,
      this.content,
      @JsonKey(name: 'content_id') this.contentId,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_at_accuracy') this.createdAtAccuracy,
      @JsonKey(name: 'created_at_str') this.createdAtStr,
      this.pos,
      @JsonKey(name: 'synced_at') this.syncedAt});

  factory _$_ContentLink.fromJson(Map<String, dynamic> json) =>
      _$$_ContentLinkFromJson(json);

  @override
  final int? id;
  @override
  final String link;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? slug;
  @override
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @override
  @JsonKey(name: 'source_id')
  final String? sourceId;
  @override
  @JsonKey(name: 'alt_source_id')
  final String? altSourceId;
  @override
  @JsonKey(name: 'platform_id')
  final int? platformId;
  @override
  final Platform? platform;
  @override
  final LinkType? type;
  @override
  final Content? content;
  @override
  @JsonKey(name: 'content_id')
  final int? contentId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  final ContentLinkCreatedAtAccuracy? createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  final String? createdAtStr;
  @override
  final int? pos;
  @override
  @JsonKey(name: 'synced_at')
  final DateTime? syncedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentLink(id: $id, link: $link, title: $title, description: $description, slug: $slug, statusCode: $statusCode, sourceId: $sourceId, altSourceId: $altSourceId, platformId: $platformId, platform: $platform, type: $type, content: $content, contentId: $contentId, createdAt: $createdAt, createdAtAccuracy: $createdAtAccuracy, createdAtStr: $createdAtStr, pos: $pos, syncedAt: $syncedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentLink'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('sourceId', sourceId))
      ..add(DiagnosticsProperty('altSourceId', altSourceId))
      ..add(DiagnosticsProperty('platformId', platformId))
      ..add(DiagnosticsProperty('platform', platform))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdAtAccuracy', createdAtAccuracy))
      ..add(DiagnosticsProperty('createdAtStr', createdAtStr))
      ..add(DiagnosticsProperty('pos', pos))
      ..add(DiagnosticsProperty('syncedAt', syncedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentLink &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.sourceId, sourceId) &&
            const DeepCollectionEquality()
                .equals(other.altSourceId, altSourceId) &&
            const DeepCollectionEquality()
                .equals(other.platformId, platformId) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.createdAtAccuracy, createdAtAccuracy) &&
            const DeepCollectionEquality()
                .equals(other.createdAtStr, createdAtStr) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality().equals(other.syncedAt, syncedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(sourceId),
      const DeepCollectionEquality().hash(altSourceId),
      const DeepCollectionEquality().hash(platformId),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdAtAccuracy),
      const DeepCollectionEquality().hash(createdAtStr),
      const DeepCollectionEquality().hash(pos),
      const DeepCollectionEquality().hash(syncedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ContentLinkCopyWith<_$_ContentLink> get copyWith =>
      __$$_ContentLinkCopyWithImpl<_$_ContentLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentLinkToJson(this);
  }
}

abstract class _ContentLink implements ContentLink {
  const factory _ContentLink(
      {final int? id,
      required final String link,
      final String? title,
      final String? description,
      final String? slug,
      @JsonKey(name: 'status_code')
          final int? statusCode,
      @JsonKey(name: 'source_id')
          final String? sourceId,
      @JsonKey(name: 'alt_source_id')
          final String? altSourceId,
      @JsonKey(name: 'platform_id')
          final int? platformId,
      final Platform? platform,
      final LinkType? type,
      final Content? content,
      @JsonKey(name: 'content_id')
          final int? contentId,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'created_at_accuracy')
          final ContentLinkCreatedAtAccuracy? createdAtAccuracy,
      @JsonKey(name: 'created_at_str')
          final String? createdAtStr,
      final int? pos,
      @JsonKey(name: 'synced_at')
          final DateTime? syncedAt}) = _$_ContentLink;

  factory _ContentLink.fromJson(Map<String, dynamic> json) =
      _$_ContentLink.fromJson;

  @override
  int? get id;
  @override
  String get link;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get slug;
  @override
  @JsonKey(name: 'status_code')
  int? get statusCode;
  @override
  @JsonKey(name: 'source_id')
  String? get sourceId;
  @override
  @JsonKey(name: 'alt_source_id')
  String? get altSourceId;
  @override
  @JsonKey(name: 'platform_id')
  int? get platformId;
  @override
  Platform? get platform;
  @override
  LinkType? get type;
  @override
  Content? get content;
  @override
  @JsonKey(name: 'content_id')
  int? get contentId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_at_accuracy')
  ContentLinkCreatedAtAccuracy? get createdAtAccuracy;
  @override
  @JsonKey(name: 'created_at_str')
  String? get createdAtStr;
  @override
  int? get pos;
  @override
  @JsonKey(name: 'synced_at')
  DateTime? get syncedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ContentLinkCopyWith<_$_ContentLink> get copyWith =>
      throw _privateConstructorUsedError;
}
