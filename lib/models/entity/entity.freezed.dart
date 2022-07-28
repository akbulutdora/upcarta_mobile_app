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
  @JsonKey(name: 'has_user')
  bool? get hasUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_entities_count')
  int? get followedEntitiesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_topics_count')
  int? get followedTopicsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'followed_contents_count')
  int? get followedContentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by')
  Entity? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;

  /// The Twitter name of the user
  String? get twitter => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get linkedin => throw _privateConstructorUsedError;
  String? get wikipedia => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_entity')
  EntityFollowing? get followingEntity => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'has_user') bool? hasUser,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
      @JsonKey(name: 'followed_contents_count') int? followedContentsCount,
      @JsonKey(name: 'added_by') Entity? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      String? twitter,
      String? website,
      String? linkedin,
      String? wikipedia,
      @JsonKey(name: 'following_entity') EntityFollowing? followingEntity,
      @JsonKey(name: 'channel_entities') List<Entity>? channelEntities});

  $EntityCopyWith<$Res>? get addedBy;
  $EntityFollowingCopyWith<$Res>? get followingEntity;
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
    Object? hasUser = freezed,
    Object? followersCount = freezed,
    Object? followedEntitiesCount = freezed,
    Object? followedTopicsCount = freezed,
    Object? followedContentsCount = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? twitter = freezed,
    Object? website = freezed,
    Object? linkedin = freezed,
    Object? wikipedia = freezed,
    Object? followingEntity = freezed,
    Object? channelEntities = freezed,
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
      followedContentsCount: followedContentsCount == freezed
          ? _value.followedContentsCount
          : followedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: linkedin == freezed
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipedia: wikipedia == freezed
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      followingEntity: followingEntity == freezed
          ? _value.followingEntity
          : followingEntity // ignore: cast_nullable_to_non_nullable
              as EntityFollowing?,
      channelEntities: channelEntities == freezed
          ? _value.channelEntities
          : channelEntities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
    ));
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
  $EntityFollowingCopyWith<$Res>? get followingEntity {
    if (_value.followingEntity == null) {
      return null;
    }

    return $EntityFollowingCopyWith<$Res>(_value.followingEntity!, (value) {
      return _then(_value.copyWith(followingEntity: value));
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
      @JsonKey(name: 'has_user') bool? hasUser,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
      @JsonKey(name: 'followed_contents_count') int? followedContentsCount,
      @JsonKey(name: 'added_by') Entity? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      String? twitter,
      String? website,
      String? linkedin,
      String? wikipedia,
      @JsonKey(name: 'following_entity') EntityFollowing? followingEntity,
      @JsonKey(name: 'channel_entities') List<Entity>? channelEntities});

  @override
  $EntityCopyWith<$Res>? get addedBy;
  @override
  $EntityFollowingCopyWith<$Res>? get followingEntity;
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
    Object? hasUser = freezed,
    Object? followersCount = freezed,
    Object? followedEntitiesCount = freezed,
    Object? followedTopicsCount = freezed,
    Object? followedContentsCount = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? twitter = freezed,
    Object? website = freezed,
    Object? linkedin = freezed,
    Object? wikipedia = freezed,
    Object? followingEntity = freezed,
    Object? channelEntities = freezed,
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
      followedContentsCount: followedContentsCount == freezed
          ? _value.followedContentsCount
          : followedContentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as Entity?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: linkedin == freezed
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      wikipedia: wikipedia == freezed
          ? _value.wikipedia
          : wikipedia // ignore: cast_nullable_to_non_nullable
              as String?,
      followingEntity: followingEntity == freezed
          ? _value.followingEntity
          : followingEntity // ignore: cast_nullable_to_non_nullable
              as EntityFollowing?,
      channelEntities: channelEntities == freezed
          ? _value._channelEntities
          : channelEntities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
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
      @JsonKey(name: 'has_user') this.hasUser,
      @JsonKey(name: 'followers_count') this.followersCount,
      @JsonKey(name: 'followed_entities_count') this.followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') this.followedTopicsCount,
      @JsonKey(name: 'followed_contents_count') this.followedContentsCount,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById,
      this.twitter,
      this.website,
      this.linkedin,
      this.wikipedia,
      @JsonKey(name: 'following_entity') this.followingEntity,
      @JsonKey(name: 'channel_entities') final List<Entity>? channelEntities})
      : _channelEntities = channelEntities;

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
  @JsonKey(name: 'followed_contents_count')
  final int? followedContentsCount;
  @override
  @JsonKey(name: 'added_by')
  final Entity? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;

  /// The Twitter name of the user
  @override
  final String? twitter;
  @override
  final String? website;
  @override
  final String? linkedin;
  @override
  final String? wikipedia;
  @override
  @JsonKey(name: 'following_entity')
  final EntityFollowing? followingEntity;
  final List<Entity>? _channelEntities;
  @override
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities {
    final value = _channelEntities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Entity(id: $id, name: $name, username: $username, description: $description, hasUser: $hasUser, followersCount: $followersCount, followedEntitiesCount: $followedEntitiesCount, followedTopicsCount: $followedTopicsCount, followedContentsCount: $followedContentsCount, addedBy: $addedBy, addedById: $addedById, twitter: $twitter, website: $website, linkedin: $linkedin, wikipedia: $wikipedia, followingEntity: $followingEntity, channelEntities: $channelEntities)';
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
      ..add(DiagnosticsProperty('hasUser', hasUser))
      ..add(DiagnosticsProperty('followersCount', followersCount))
      ..add(DiagnosticsProperty('followedEntitiesCount', followedEntitiesCount))
      ..add(DiagnosticsProperty('followedTopicsCount', followedTopicsCount))
      ..add(DiagnosticsProperty('followedContentsCount', followedContentsCount))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('twitter', twitter))
      ..add(DiagnosticsProperty('website', website))
      ..add(DiagnosticsProperty('linkedin', linkedin))
      ..add(DiagnosticsProperty('wikipedia', wikipedia))
      ..add(DiagnosticsProperty('followingEntity', followingEntity))
      ..add(DiagnosticsProperty('channelEntities', channelEntities));
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
            const DeepCollectionEquality().equals(other.hasUser, hasUser) &&
            const DeepCollectionEquality()
                .equals(other.followersCount, followersCount) &&
            const DeepCollectionEquality()
                .equals(other.followedEntitiesCount, followedEntitiesCount) &&
            const DeepCollectionEquality()
                .equals(other.followedTopicsCount, followedTopicsCount) &&
            const DeepCollectionEquality()
                .equals(other.followedContentsCount, followedContentsCount) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality().equals(other.twitter, twitter) &&
            const DeepCollectionEquality().equals(other.website, website) &&
            const DeepCollectionEquality().equals(other.linkedin, linkedin) &&
            const DeepCollectionEquality().equals(other.wikipedia, wikipedia) &&
            const DeepCollectionEquality()
                .equals(other.followingEntity, followingEntity) &&
            const DeepCollectionEquality()
                .equals(other._channelEntities, _channelEntities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(hasUser),
      const DeepCollectionEquality().hash(followersCount),
      const DeepCollectionEquality().hash(followedEntitiesCount),
      const DeepCollectionEquality().hash(followedTopicsCount),
      const DeepCollectionEquality().hash(followedContentsCount),
      const DeepCollectionEquality().hash(addedBy),
      const DeepCollectionEquality().hash(addedById),
      const DeepCollectionEquality().hash(twitter),
      const DeepCollectionEquality().hash(website),
      const DeepCollectionEquality().hash(linkedin),
      const DeepCollectionEquality().hash(wikipedia),
      const DeepCollectionEquality().hash(followingEntity),
      const DeepCollectionEquality().hash(_channelEntities));

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
      @JsonKey(name: 'has_user')
          final bool? hasUser,
      @JsonKey(name: 'followers_count')
          final int? followersCount,
      @JsonKey(name: 'followed_entities_count')
          final int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count')
          final int? followedTopicsCount,
      @JsonKey(name: 'followed_contents_count')
          final int? followedContentsCount,
      @JsonKey(name: 'added_by')
          final Entity? addedBy,
      @JsonKey(name: 'added_by_id')
          final int? addedById,
      final String? twitter,
      final String? website,
      final String? linkedin,
      final String? wikipedia,
      @JsonKey(name: 'following_entity')
          final EntityFollowing? followingEntity,
      @JsonKey(name: 'channel_entities')
          final List<Entity>? channelEntities}) = _$_Entity;

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
  @JsonKey(name: 'followed_contents_count')
  int? get followedContentsCount;
  @override
  @JsonKey(name: 'added_by')
  Entity? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override

  /// The Twitter name of the user
  String? get twitter;
  @override
  String? get website;
  @override
  String? get linkedin;
  @override
  String? get wikipedia;
  @override
  @JsonKey(name: 'following_entity')
  EntityFollowing? get followingEntity;
  @override
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities;
  @override
  @JsonKey(ignore: true)
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      throw _privateConstructorUsedError;
}
