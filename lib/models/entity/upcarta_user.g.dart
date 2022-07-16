// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcarta_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      unconfirmedEmail: json['unconfirmed_email'] as String?,
      displayEmail: json['display_email'] as String?,
      password: json['password'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      identities: (json['identities'] as List<dynamic>?)
          ?.map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      entity: json['entity'] == null
          ? null
          : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'unconfirmed_email': instance.unconfirmedEmail,
      'display_email': instance.displayEmail,
      'password': instance.password,
      'role': _$RoleEnumMap[instance.role],
      'identities': instance.identities,
      'entity': instance.entity,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.admin: 'admin',
  Role.curator: 'curator',
  Role.contributor: 'contributor',
};
