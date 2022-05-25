import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "auth_user.g.dart";

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String? name;
  final String? email;
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

  const User({
    required this.id,
    this.name,
    this.email,
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
  static const empty = User(
      id: "",
      name: "",
      photoURL: "",
      email: "",
      username: "",
      bio: "",
      recommendationsID: "",
      savesID: "",
      joinDate: "");

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        photoURL,
        email,
      ];
}
