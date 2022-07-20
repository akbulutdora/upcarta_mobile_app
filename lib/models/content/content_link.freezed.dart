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
  String get link =>
      throw _privateConstructorUsedError; //yeni semada cikarilmis
//String? title,
//String? description,
//String? slug,
//@JsonKey(name: 'status_code')   int? statusCode,
//@JsonKey(name: 'source_id')     String? sourceId,
//@JsonKey(name: 'alt_source_id') String? altSourceId,
//@JsonKey(name: 'platform_id')     int? platformId,
//Platform? platform,
//LinkType? type,
  Content? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id')
  int? get contentId =>
      throw _privateConstructorUsedError; //yeni semada silinmis
//@JsonKey(name: 'created_at') DateTime? createdAt,
//@JsonKey(name: 'created_at_accuracy') ContentLinkCreatedAtAccuracy? createdAtAccuracy,
//@JsonKey(name: 'created_at_str') String? createdAtStr,
  int? get pos => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_embed')
  bool? get hasEmbed => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_ratings')
  bool? get hasRatings => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode_number')
  int? get episodeNumber => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError; //todo: details
  Details? get details => throw _privateConstructorUsedError;

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
      Content? content,
      @JsonKey(name: 'content_id') int? contentId,
      int? pos,
      String? body,
      @JsonKey(name: 'has_embed') bool? hasEmbed,
      @JsonKey(name: 'has_ratings') bool? hasRatings,
      @JsonKey(name: 'episode_number') int? episodeNumber,
      int? duration,
      Details? details});

  $ContentCopyWith<$Res>? get content;
  $DetailsCopyWith<$Res>? get details;
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
    Object? content = freezed,
    Object? contentId = freezed,
    Object? pos = freezed,
    Object? body = freezed,
    Object? hasEmbed = freezed,
    Object? hasRatings = freezed,
    Object? episodeNumber = freezed,
    Object? duration = freezed,
    Object? details = freezed,
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
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      hasEmbed: hasEmbed == freezed
          ? _value.hasEmbed
          : hasEmbed // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasRatings: hasRatings == freezed
          ? _value.hasRatings
          : hasRatings // ignore: cast_nullable_to_non_nullable
              as bool?,
      episodeNumber: episodeNumber == freezed
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
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
  $DetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $DetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value));
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
      Content? content,
      @JsonKey(name: 'content_id') int? contentId,
      int? pos,
      String? body,
      @JsonKey(name: 'has_embed') bool? hasEmbed,
      @JsonKey(name: 'has_ratings') bool? hasRatings,
      @JsonKey(name: 'episode_number') int? episodeNumber,
      int? duration,
      Details? details});

  @override
  $ContentCopyWith<$Res>? get content;
  @override
  $DetailsCopyWith<$Res>? get details;
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
    Object? content = freezed,
    Object? contentId = freezed,
    Object? pos = freezed,
    Object? body = freezed,
    Object? hasEmbed = freezed,
    Object? hasRatings = freezed,
    Object? episodeNumber = freezed,
    Object? duration = freezed,
    Object? details = freezed,
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
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      hasEmbed: hasEmbed == freezed
          ? _value.hasEmbed
          : hasEmbed // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasRatings: hasRatings == freezed
          ? _value.hasRatings
          : hasRatings // ignore: cast_nullable_to_non_nullable
              as bool?,
      episodeNumber: episodeNumber == freezed
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentLink with DiagnosticableTreeMixin implements _ContentLink {
  const _$_ContentLink(
      {this.id,
      required this.link,
      this.content,
      @JsonKey(name: 'content_id') this.contentId,
      this.pos,
      this.body,
      @JsonKey(name: 'has_embed') this.hasEmbed,
      @JsonKey(name: 'has_ratings') this.hasRatings,
      @JsonKey(name: 'episode_number') this.episodeNumber,
      this.duration,
      this.details});

  factory _$_ContentLink.fromJson(Map<String, dynamic> json) =>
      _$$_ContentLinkFromJson(json);

  @override
  final int? id;
  @override
  final String link;
//yeni semada cikarilmis
//String? title,
//String? description,
//String? slug,
//@JsonKey(name: 'status_code')   int? statusCode,
//@JsonKey(name: 'source_id')     String? sourceId,
//@JsonKey(name: 'alt_source_id') String? altSourceId,
//@JsonKey(name: 'platform_id')     int? platformId,
//Platform? platform,
//LinkType? type,
  @override
  final Content? content;
  @override
  @JsonKey(name: 'content_id')
  final int? contentId;
//yeni semada silinmis
//@JsonKey(name: 'created_at') DateTime? createdAt,
//@JsonKey(name: 'created_at_accuracy') ContentLinkCreatedAtAccuracy? createdAtAccuracy,
//@JsonKey(name: 'created_at_str') String? createdAtStr,
  @override
  final int? pos;
  @override
  final String? body;
  @override
  @JsonKey(name: 'has_embed')
  final bool? hasEmbed;
  @override
  @JsonKey(name: 'has_ratings')
  final bool? hasRatings;
  @override
  @JsonKey(name: 'episode_number')
  final int? episodeNumber;
  @override
  final int? duration;
//todo: details
  @override
  final Details? details;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentLink(id: $id, link: $link, content: $content, contentId: $contentId, pos: $pos, body: $body, hasEmbed: $hasEmbed, hasRatings: $hasRatings, episodeNumber: $episodeNumber, duration: $duration, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentLink'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('pos', pos))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('hasEmbed', hasEmbed))
      ..add(DiagnosticsProperty('hasRatings', hasRatings))
      ..add(DiagnosticsProperty('episodeNumber', episodeNumber))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentLink &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.hasEmbed, hasEmbed) &&
            const DeepCollectionEquality()
                .equals(other.hasRatings, hasRatings) &&
            const DeepCollectionEquality()
                .equals(other.episodeNumber, episodeNumber) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(pos),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(hasEmbed),
      const DeepCollectionEquality().hash(hasRatings),
      const DeepCollectionEquality().hash(episodeNumber),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(details));

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
      final Content? content,
      @JsonKey(name: 'content_id') final int? contentId,
      final int? pos,
      final String? body,
      @JsonKey(name: 'has_embed') final bool? hasEmbed,
      @JsonKey(name: 'has_ratings') final bool? hasRatings,
      @JsonKey(name: 'episode_number') final int? episodeNumber,
      final int? duration,
      final Details? details}) = _$_ContentLink;

  factory _ContentLink.fromJson(Map<String, dynamic> json) =
      _$_ContentLink.fromJson;

  @override
  int? get id;
  @override
  String get link;
  @override //yeni semada cikarilmis
//String? title,
//String? description,
//String? slug,
//@JsonKey(name: 'status_code')   int? statusCode,
//@JsonKey(name: 'source_id')     String? sourceId,
//@JsonKey(name: 'alt_source_id') String? altSourceId,
//@JsonKey(name: 'platform_id')     int? platformId,
//Platform? platform,
//LinkType? type,
  Content? get content;
  @override
  @JsonKey(name: 'content_id')
  int? get contentId;
  @override //yeni semada silinmis
//@JsonKey(name: 'created_at') DateTime? createdAt,
//@JsonKey(name: 'created_at_accuracy') ContentLinkCreatedAtAccuracy? createdAtAccuracy,
//@JsonKey(name: 'created_at_str') String? createdAtStr,
  int? get pos;
  @override
  String? get body;
  @override
  @JsonKey(name: 'has_embed')
  bool? get hasEmbed;
  @override
  @JsonKey(name: 'has_ratings')
  bool? get hasRatings;
  @override
  @JsonKey(name: 'episode_number')
  int? get episodeNumber;
  @override
  int? get duration;
  @override //todo: details
  Details? get details;
  @override
  @JsonKey(ignore: true)
  _$$_ContentLinkCopyWith<_$_ContentLink> get copyWith =>
      throw _privateConstructorUsedError;
}
