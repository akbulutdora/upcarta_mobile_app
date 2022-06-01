// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoURL: json['photoURL'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      recommendationsID: json['recommendationsID'] as String?,
      savesID: json['savesID'] as String?,
      joinDate: json['joinDate'] as String?,
      asksIDs:
          (json['asksIDs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      collectionsIDs: (json['collectionsIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followerIDs: (json['followerIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followingIDs: (json['followingIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recommendationCount: json['recommendationCount'] as int? ?? 0,
      followedTopicIDs: (json['followedTopicIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'username': instance.username,
      'followerIDs': instance.followerIDs,
      'followingIDs': instance.followingIDs,
      'followedTopicIDs': instance.followedTopicIDs,
      'bio': instance.bio,
      'recommendationCount': instance.recommendationCount,
      'recommendationsID': instance.recommendationsID,
      'savesID': instance.savesID,
      'collectionsIDs': instance.collectionsIDs,
      'asksIDs': instance.asksIDs,
      'joinDate': instance.joinDate,
    };
