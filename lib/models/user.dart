import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// {@template user}
/// User model
///
/// [AppUser.empty] represents an unauthenticated user.
/// {@endtemplate}
///
@JsonSerializable()
class AppUser extends Equatable {
  /// {@macro user}
  const AppUser({
    required this.id,
    this.email,
    this.name,
    this.photoURL,
    this.username,
    this.bio,
    this.recommendationsID,
    this.savesID,
    this.joinDate,
    this.asksIDs,
    this.collectionsIDs,
    this.followerIDs,
    this.followingIDs,
    this.recommendationCount = 0,
    this.followedTopicIDs,
  });

  /// The JSON serializer
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  /// The JSON serializer
  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photoURL;

  /// The current user's username
  final String? username;

  /// IDs of followers the current user has
  final List<String>? followerIDs;

  /// IDs of followings the current user has
  final List<String>? followingIDs;

  /// IDs of topics the current user follows

  final List<String>? followedTopicIDs;

  /// The current user's bio description text
  final String? bio;

  /// The current user's recommendation count
  final int recommendationCount;

  /// The IDs of recommendations of current user
  final String? recommendationsID;

  /// The IDs of saves of current user
  final String? savesID;

  /// IDs of collections of current user
  final List<String>? collectionsIDs;

  /// IDs of asks of current user
  final List<String>? asksIDs;

  /// the join date of current user
  final String? joinDate;

  /// Empty user which represents an unauthenticated user.
  static const empty = AppUser(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == AppUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != AppUser.empty;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        photoURL,
        username,
        followerIDs,
        followingIDs,
        followedTopicIDs,
        bio,
        recommendationCount,
        recommendationsID,
        savesID,
        collectionsIDs,
        asksIDs,
        joinDate
      ];
}
