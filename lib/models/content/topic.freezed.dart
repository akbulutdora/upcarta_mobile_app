// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return _Topic.fromJson(json);
}

/// @nodoc
mixin _$Topic {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get wikipedia => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'contents_count')
  int? get contentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by')
  User? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicCopyWith<Topic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicCopyWith<$Res> {
  factory $TopicCopyWith(Topic value, $Res Function(Topic) then) =
      _$TopicCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      String? description,
      String? wikipedia,
      String? slug,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'contents_count') int? contentsCount,
      @JsonKey(name: 'added_by') User? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      String? keywords,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt});

  $UserCopyWith<$Res>? get addedBy;
}

/// @nodoc
class _$TopicCopyWithImpl<$Res> implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._value, this._then);

  final Topic _value;
  // ignore: unused_field
  final $Res Function(Topic) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? wikipedia = freezed,
    Object? slug = freezed,
    Object? followersCount = freezed,
    Object? contentsCount = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? keywords = freezed,
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
      wikipedia: wikipedia == freezed
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      contentsCount: contentsCount == freezed
          ? _value.contentsCount
          : contentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get addedBy {
    if (_value.addedBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.addedBy!, (value) {
      return _then(_value.copyWith(addedBy: value));
    });
  }
}

/// @nodoc
abstract class _$$_TopicCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$$_TopicCopyWith(_$_Topic value, $Res Function(_$_Topic) then) =
      __$$_TopicCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      String? description,
      String? wikipedia,
      String? slug,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'contents_count') int? contentsCount,
      @JsonKey(name: 'added_by') User? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      String? keywords,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt});

  @override
  $UserCopyWith<$Res>? get addedBy;
}

/// @nodoc
class __$$_TopicCopyWithImpl<$Res> extends _$TopicCopyWithImpl<$Res>
    implements _$$_TopicCopyWith<$Res> {
  __$$_TopicCopyWithImpl(_$_Topic _value, $Res Function(_$_Topic) _then)
      : super(_value, (v) => _then(v as _$_Topic));

  @override
  _$_Topic get _value => super._value as _$_Topic;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? wikipedia = freezed,
    Object? slug = freezed,
    Object? followersCount = freezed,
    Object? contentsCount = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? keywords = freezed,
    Object? insertedAt = freezed,
  }) {
    return _then(_$_Topic(
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
      wikipedia: wikipedia == freezed
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      contentsCount: contentsCount == freezed
          ? _value.contentsCount
          : contentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Topic with DiagnosticableTreeMixin implements _Topic {
  const _$_Topic(
      {this.id,
      required this.title,
      this.description,
      this.wikipedia,
      required this.slug,
      @JsonKey(name: 'followers_count') this.followersCount,
      @JsonKey(name: 'contents_count') this.contentsCount,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById,
      this.keywords,
      @JsonKey(name: 'inserted_at') this.insertedAt});

  factory _$_Topic.fromJson(Map<String, dynamic> json) =>
      _$$_TopicFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? wikipedia;
  @override
  final String? slug;
  @override
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @JsonKey(name: 'contents_count')
  final int? contentsCount;
  @override
  @JsonKey(name: 'added_by')
  final User? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;
  @override
  final String? keywords;
  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Topic(id: $id, title: $title, description: $description, wikipedia: $wikipedia, slug: $slug, followersCount: $followersCount, contentsCount: $contentsCount, addedBy: $addedBy, addedById: $addedById, keywords: $keywords, insertedAt: $insertedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Topic'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('wikipedia', wikipedia))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('followersCount', followersCount))
      ..add(DiagnosticsProperty('contentsCount', contentsCount))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('keywords', keywords))
      ..add(DiagnosticsProperty('insertedAt', insertedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Topic &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.wikipedia, wikipedia) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality()
                .equals(other.followersCount, followersCount) &&
            const DeepCollectionEquality()
                .equals(other.contentsCount, contentsCount) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality().equals(other.keywords, keywords) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(wikipedia),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(followersCount),
      const DeepCollectionEquality().hash(contentsCount),
      const DeepCollectionEquality().hash(addedBy),
      const DeepCollectionEquality().hash(addedById),
      const DeepCollectionEquality().hash(keywords),
      const DeepCollectionEquality().hash(insertedAt));

  @JsonKey(ignore: true)
  @override
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      __$$_TopicCopyWithImpl<_$_Topic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicToJson(this);
  }
}

abstract class _Topic implements Topic {
  const factory _Topic(
      {final int? id,
      required final String title,
      final String? description,
      final String? wikipedia,
      required final String? slug,
      @JsonKey(name: 'followers_count') final int? followersCount,
      @JsonKey(name: 'contents_count') final int? contentsCount,
      @JsonKey(name: 'added_by') final User? addedBy,
      @JsonKey(name: 'added_by_id') final int? addedById,
      final String? keywords,
      @JsonKey(name: 'inserted_at') final DateTime? insertedAt}) = _$_Topic;

  factory _Topic.fromJson(Map<String, dynamic> json) = _$_Topic.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get wikipedia;
  @override
  String? get slug;
  @override
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @JsonKey(name: 'contents_count')
  int? get contentsCount;
  @override
  @JsonKey(name: 'added_by')
  User? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  String? get keywords;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TopicCopyWith<_$_Topic> get copyWith =>
      throw _privateConstructorUsedError;
}
