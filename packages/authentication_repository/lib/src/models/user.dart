import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
///
@JsonSerializable()
class User extends Equatable {
  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photoURL;
  final String? username;
  final int followers = 0;
  final int following = 0;
  final List<int>? followerIDs;
  final List<int>? followingIDs;
  final String? bio;
  final int recommendationCount = 0;
  final String? recommendationsID;
  final String? savesID;
  final List<int>? collectionsIDs;
  final List<int>? asksIDs;
  final String? joinDate;

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
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [email, id, name, photoURL];
}
