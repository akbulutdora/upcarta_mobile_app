// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return _Entity.fromJson(json);
}

/// @nodoc
mixin _$Entity {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_user')
  bool? get hasUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_entities_count')
  int? get followedEntitiesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_topics_count')
  int? get followedTopicsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_contents_count')
  int? get addedContentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_contents_count')
  int? get followedContentsCount => throw _privateConstructorUsedError;

  /// The Twitter name of the user
  String? get twitter => throw _privateConstructorUsedError;

  /// The internal ID of the user from Twitter
  @JsonKey(name: 'twitter_id')
  int? get twitterID => throw _privateConstructorUsedError;

  /// When the user was displayed in curations, this value will be [null]
  /// if the user was featured.
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityCopyWith<Entity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String name,
      String username,
      String? description,
      User? user,
      @JsonKey(name: 'has_user') bool? hasUser,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
      @JsonKey(name: 'added_contents_count') int? addedContentsCount,
      @JsonKey(name: 'followed_contents_count') int? followedContentsCount,
      String? twitter,
      @JsonKey(name: 'twitter_id') int? twitterID,
      @JsonKey(name: 'featured_at') DateTime? featuredAt,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$EntityCopyWithImpl<$Res> implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  final Entity _value;
  // ignore: unused_field
  final $Res Function(Entity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? description = freezed,
    Object? user = freezed,
    Object? hasUser = freezed,
    Object? followersCount = freezed,
    Object? followedEntitiesCount = freezed,
    Object? followedTopicsCount = freezed,
    Object? addedContentsCount = freezed,
    Object? followedContentsCount = freezed,
    Object? twitter = freezed,
    Object? twitterID = freezed,
    Object? featuredAt = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      hasUser: hasUser == freezed
          ? _value.hasUser
          : hasUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedEntitiesCount: followedEntitiesCount == freezed
          ? _value.followedEntitiesCount
          : followedEntitiesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedTopicsCount: followedTopicsCount == freezed
          ? _value.followedTopicsCount
          : followedTopicsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedContentsCount: addedContentsCount == freezed
          ? _value.addedContentsCount
          : addedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedContentsCount: followedContentsCount == freezed
          ? _value.followedContentsCount
          : followedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterID: twitterID == freezed
          ? _value.twitterID
          : twitterID // ignore: cast_nullable_to_non_nullable
              as int?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_EntityCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory _$$_EntityCopyWith(_$_Entity value, $Res Function(_$_Entity) then) =
      __$$_EntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String name,
      String username,
      String? description,
      User? user,
      @JsonKey(name: 'has_user') bool? hasUser,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
      @JsonKey(name: 'added_contents_count') int? addedContentsCount,
      @JsonKey(name: 'followed_contents_count') int? followedContentsCount,
      String? twitter,
      @JsonKey(name: 'twitter_id') int? twitterID,
      @JsonKey(name: 'featured_at') DateTime? featuredAt,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_EntityCopyWithImpl<$Res> extends _$EntityCopyWithImpl<$Res>
    implements _$$_EntityCopyWith<$Res> {
  __$$_EntityCopyWithImpl(_$_Entity _value, $Res Function(_$_Entity) _then)
      : super(_value, (v) => _then(v as _$_Entity));

  @override
  _$_Entity get _value => super._value as _$_Entity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? description = freezed,
    Object? user = freezed,
    Object? hasUser = freezed,
    Object? followersCount = freezed,
    Object? followedEntitiesCount = freezed,
    Object? followedTopicsCount = freezed,
    Object? addedContentsCount = freezed,
    Object? followedContentsCount = freezed,
    Object? twitter = freezed,
    Object? twitterID = freezed,
    Object? featuredAt = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Entity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      hasUser: hasUser == freezed
          ? _value.hasUser
          : hasUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: followersCount == freezed
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedEntitiesCount: followedEntitiesCount == freezed
          ? _value.followedEntitiesCount
          : followedEntitiesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedTopicsCount: followedTopicsCount == freezed
          ? _value.followedTopicsCount
          : followedTopicsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedContentsCount: addedContentsCount == freezed
          ? _value.addedContentsCount
          : addedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followedContentsCount: followedContentsCount == freezed
          ? _value.followedContentsCount
          : followedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterID: twitterID == freezed
          ? _value.twitterID
          : twitterID // ignore: cast_nullable_to_non_nullable
              as int?,
      featuredAt: featuredAt == freezed
          ? _value.featuredAt
          : featuredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entity with DiagnosticableTreeMixin implements _Entity {
  const _$_Entity(
      {this.id,
      required this.name,
      required this.username,
      this.description,
      this.user,
      @JsonKey(name: 'has_user') this.hasUser,
      @JsonKey(name: 'followers_count') this.followersCount,
      @JsonKey(name: 'followed_entities_count') this.followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') this.followedTopicsCount,
      @JsonKey(name: 'added_contents_count') this.addedContentsCount,
      @JsonKey(name: 'followed_contents_count') this.followedContentsCount,
      this.twitter,
      @JsonKey(name: 'twitter_id') this.twitterID,
      @JsonKey(name: 'featured_at') this.featuredAt,
      @JsonKey(name: 'inserted_at') this.insertedAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_Entity.fromJson(Map<String, dynamic> json) =>
      _$$_EntityFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String? description;
  @override
  final User? user;
  @override
  @JsonKey(name: 'has_user')
  final bool? hasUser;
  @override
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @JsonKey(name: 'followed_entities_count')
  final int? followedEntitiesCount;
  @override
  @JsonKey(name: 'followed_topics_count')
  final int? followedTopicsCount;
  @override
  @JsonKey(name: 'added_contents_count')
  final int? addedContentsCount;
  @override
  @JsonKey(name: 'followed_contents_count')
  final int? followedContentsCount;

  /// The Twitter name of the user
  @override
  final String? twitter;

  /// The internal ID of the user from Twitter
  @override
  @JsonKey(name: 'twitter_id')
  final int? twitterID;

  /// When the user was displayed in curations, this value will be [null]
  /// if the user was featured.
  @override
  @JsonKey(name: 'featured_at')
  final DateTime? featuredAt;
  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Entity(id: $id, name: $name, username: $username, description: $description, user: $user, hasUser: $hasUser, followersCount: $followersCount, followedEntitiesCount: $followedEntitiesCount, followedTopicsCount: $followedTopicsCount, addedContentsCount: $addedContentsCount, followedContentsCount: $followedContentsCount, twitter: $twitter, twitterID: $twitterID, featuredAt: $featuredAt, insertedAt: $insertedAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Entity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('hasUser', hasUser))
      ..add(DiagnosticsProperty('followersCount', followersCount))
      ..add(DiagnosticsProperty('followedEntitiesCount', followedEntitiesCount))
      ..add(DiagnosticsProperty('followedTopicsCount', followedTopicsCount))
      ..add(DiagnosticsProperty('addedContentsCount', addedContentsCount))
      ..add(DiagnosticsProperty('followedContentsCount', followedContentsCount))
      ..add(DiagnosticsProperty('twitter', twitter))
      ..add(DiagnosticsProperty('twitterID', twitterID))
      ..add(DiagnosticsProperty('featuredAt', featuredAt))
      ..add(DiagnosticsProperty('insertedAt', insertedAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.hasUser, hasUser) &&
            const DeepCollectionEquality()
                .equals(other.followersCount, followersCount) &&
            const DeepCollectionEquality()
                .equals(other.followedEntitiesCount, followedEntitiesCount) &&
            const DeepCollectionEquality()
                .equals(other.followedTopicsCount, followedTopicsCount) &&
            const DeepCollectionEquality()
                .equals(other.addedContentsCount, addedContentsCount) &&
            const DeepCollectionEquality()
                .equals(other.followedContentsCount, followedContentsCount) &&
            const DeepCollectionEquality().equals(other.twitter, twitter) &&
            const DeepCollectionEquality().equals(other.twitterID, twitterID) &&
            const DeepCollectionEquality()
                .equals(other.featuredAt, featuredAt) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(hasUser),
      const DeepCollectionEquality().hash(followersCount),
      const DeepCollectionEquality().hash(followedEntitiesCount),
      const DeepCollectionEquality().hash(followedTopicsCount),
      const DeepCollectionEquality().hash(addedContentsCount),
      const DeepCollectionEquality().hash(followedContentsCount),
      const DeepCollectionEquality().hash(twitter),
      const DeepCollectionEquality().hash(twitterID),
      const DeepCollectionEquality().hash(featuredAt),
      const DeepCollectionEquality().hash(insertedAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      __$$_EntityCopyWithImpl<_$_Entity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityToJson(this);
  }
}

abstract class _Entity implements Entity {
  const factory _Entity(
      {final int? id,
      required final String name,
      required final String username,
      final String? description,
      final User? user,
      @JsonKey(name: 'has_user')
          final bool? hasUser,
      @JsonKey(name: 'followers_count')
          final int? followersCount,
      @JsonKey(name: 'followed_entities_count')
          final int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count')
          final int? followedTopicsCount,
      @JsonKey(name: 'added_contents_count')
          final int? addedContentsCount,
      @JsonKey(name: 'followed_contents_count')
          final int? followedContentsCount,
      final String? twitter,
      @JsonKey(name: 'twitter_id')
          final int? twitterID,
      @JsonKey(name: 'featured_at')
          final DateTime? featuredAt,
      @JsonKey(name: 'inserted_at')
          final DateTime? insertedAt,
      @JsonKey(name: 'updated_at')
          final DateTime? updatedAt}) = _$_Entity;

  factory _Entity.fromJson(Map<String, dynamic> json) = _$_Entity.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String? get description;
  @override
  User? get user;
  @override
  @JsonKey(name: 'has_user')
  bool? get hasUser;
  @override
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @JsonKey(name: 'followed_entities_count')
  int? get followedEntitiesCount;
  @override
  @JsonKey(name: 'followed_topics_count')
  int? get followedTopicsCount;
  @override
  @JsonKey(name: 'added_contents_count')
  int? get addedContentsCount;
  @override
  @JsonKey(name: 'followed_contents_count')
  int? get followedContentsCount;
  @override

  /// The Twitter name of the user
  String? get twitter;
  @override

  /// The internal ID of the user from Twitter
  @JsonKey(name: 'twitter_id')
  int? get twitterID;
  @override

  /// When the user was displayed in curations, this value will be [null]
  /// if the user was featured.
  @JsonKey(name: 'featured_at')
  DateTime? get featuredAt;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      throw _privateConstructorUsedError;
}
