// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
      password_hash: json['password_hash'] as String? ?? "",
      confirmation_sent_at: json['confirmation_sent_at'] as String? ?? "",
      confirmed_at: json['confirmed_at'] as String? ?? "",
      confirmation_token: json['confirmation_token'] as String? ?? "",
      reset_password_token: json['reset_password_token'] as String? ?? "",
      reset_password_sent_at: json['reset_password_sent_at'] as String? ?? "",
      avatar: json['avatar'] as String,
      bio: json['bio'] as String,
      darkMode: json['darkMode'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'followers': instance.followers,
      'following': instance.following,
      'password_hash': instance.password_hash,
      'confirmation_sent_at': instance.confirmation_sent_at,
      'confirmed_at': instance.confirmed_at,
      'confirmation_token': instance.confirmation_token,
      'reset_password_token': instance.reset_password_token,
      'reset_password_sent_at': instance.reset_password_sent_at,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'darkMode': instance.darkMode,
    };
