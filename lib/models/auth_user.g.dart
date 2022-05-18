// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$UserFromJson(Map<String, dynamic> json) => AuthUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$UserToJson(AuthUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoURL': instance.photoURL,
    };
