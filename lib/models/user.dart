import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
///
@JsonSerializable()
class User extends Equatable {
  /// {@macro user}
  const User({
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
    this.followers = 0,
    this.following = 0,
    this.recommendationCount = 0,
    this.followedTopicIDs,
  });

  /// The JSON serializer
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// The JSON serializer
  Map<String, dynamic> toJson() => _$UserToJson(this);

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

  /// Number of followers the current user has
  final int followers;

  /// Number of followings the current user has
  final int following;

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
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photoURL];
}
