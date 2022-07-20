// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Identity _$$_IdentityFromJson(Map<String, dynamic> json) => _$_Identity(
      id: json['id'] as int?,
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      uid: json['uid'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
      secret: json['secret'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as int?,
      insertedAt: json['inserted_at'] == null
          ? null
          : DateTime.parse(json['inserted_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_IdentityToJson(_$_Identity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': _$ProviderEnumMap[instance.provider],
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'token': instance.token,
      'secret': instance.secret,
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
      'inserted_at': instance.insertedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$ProviderEnumMap = {
  Provider.twitter: 'twitter',
  Provider.email: 'email',
};
