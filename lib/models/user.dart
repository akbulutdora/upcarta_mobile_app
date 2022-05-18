import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User extends Equatable{
  final String id;
  final String name;
  final String username;
  final String email;
  final int followers;
  final int following;
  final List<int> followerIDs;
  final List<int> followingIDs;
  final String avatar;
  final String bio;
  final int recommendationCount;
  final String recommendationsID;
  final String savesID;
  final List<int> collectionsIDs;
  final List<int> asksIDs;
  final DateTime joinDate;

  User({
    required this.username,
    required this.id,
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    required this.joinDate,
    required this.avatar,
    required this.bio,
    required this.followerIDs,
    required this.followingIDs,
    required this.recommendationCount,
    required this.recommendationsID,
    required this.savesID,
    required this.collectionsIDs,
    required this.asksIDs,
  });

  User.empty(
      {this.id = "",
      this.name = "",
      this.username = "",
      this.email = "",
      this.followers = 0,
      this.following = 0,
      required this.followerIDs,
      required this.followingIDs,
      this.avatar = "",
      this.bio = "",
      this.recommendationCount = 0,
      this.recommendationsID = "",
      this.savesID = "",
      required this.collectionsIDs,
      required this.asksIDs,
      required this.joinDate});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, name, username, email, followers,following,followerIDs,followingIDs,
                              avatar,bio,recommendationCount,recommendationsID,savesID,collectionsIDs,
                              asksIDs,joinDate
                             ];
}
