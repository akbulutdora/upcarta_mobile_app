import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class OldUser extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final int followers;
  final int following;
  final List<int>? followerIDs;
  final List<int>? followingIDs;
  String avatar;
  final String bio;
  final int recommendationCount;
  final String recommendationsID;
  final String savesID;
  final List<int>? collectionsIDs;
  final List<int>? asksIDs;
  final DateTime? joinDate;

  OldUser({
    required this.username,
    required this.id,
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    this.joinDate,
    required this.avatar,
    required this.bio,
    this.followerIDs,
    this.followingIDs,
    required this.recommendationCount,
    required this.recommendationsID,
    required this.savesID,
    this.collectionsIDs,
    this.asksIDs,
  });

  static final empty = OldUser(
    id: "",
    name: "",
    username: "",
    email: "",
    followers: 0,
    following: 0,
    avatar: "",
    bio: "",
    recommendationCount: 0,
    recommendationsID: "",
    savesID: "",
  );

  bool get isEmpty => this == OldUser.empty;
  bool get isNotEmpty => this != OldUser.empty;

  factory OldUser.fromJson(Map<String, dynamic> json) => _$OldUserFromJson(json);
  Map<String, dynamic> toJson() => _$OldUserToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        followers,
        following,
        followerIDs,
        followingIDs,
        avatar,
        bio,
        recommendationCount,
        recommendationsID,
        savesID,
        collectionsIDs,
        asksIDs,
        joinDate
      ];
}
