// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldUser _$OldUserFromJson(Map<String, dynamic> json) => OldUser(
      username: json['username'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
      joinDate: json['joinDate'] == null
          ? null
          : DateTime.parse(json['joinDate'] as String),
      avatar: json['avatar'] as String,
      bio: json['bio'] as String,
      followerIDs: (json['followerIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      followingIDs: (json['followingIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      recommendationCount: json['recommendationCount'] as int,
      recommendationsID: json['recommendationsID'] as String,
      savesID: json['savesID'] as String,
      collectionsIDs: (json['collectionsIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      asksIDs:
          (json['asksIDs'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$OldUserToJson(OldUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'followers': instance.followers,
      'following': instance.following,
      'followerIDs': instance.followerIDs,
      'followingIDs': instance.followingIDs,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'recommendationCount': instance.recommendationCount,
      'recommendationsID': instance.recommendationsID,
      'savesID': instance.savesID,
      'collectionsIDs': instance.collectionsIDs,
      'asksIDs': instance.asksIDs,
      'joinDate': instance.joinDate?.toIso8601String(),
    };
