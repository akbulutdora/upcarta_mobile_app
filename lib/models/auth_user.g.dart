// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => AuthUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photoURL: json['photoURL'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      recommendationsID: json['recommendationsID'] as String?,
      savesID: json['savesID'] as String?,
      joinDate: json['joinDate'] as String?,
      asksIDs:
          (json['asksIDs'] as List<dynamic>?)?.map((e) => e as int).toList(),
      collectionsIDs: (json['collectionsIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      followerIDs: (json['followerIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      followingIDs: (json['followingIDs'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'username': instance.username,
      'followerIDs': instance.followerIDs,
      'followingIDs': instance.followingIDs,
      'bio': instance.bio,
      'recommendationsID': instance.recommendationsID,
      'savesID': instance.savesID,
      'collectionsIDs': instance.collectionsIDs,
      'asksIDs': instance.asksIDs,
      'joinDate': instance.joinDate,
    };
