// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcarta_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      email: json['email'] as String,
      unconfirmedEmail: json['unconfirmed_email'] as String?,
      displayEmail: json['display_email'] as String?,
      confirmedAt: json['confirmed_at'] == null
          ? null
          : DateTime.parse(json['confirmed_at'] as String),
      password: json['password'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      identities: (json['identities'] as List<dynamic>?)
          ?.map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      entity: json['entity'] == null
          ? null
          : Entity.fromJson(json['entity'] as Map<String, dynamic>),
      entityId: json['entity_id'] as int?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'unconfirmed_email': instance.unconfirmedEmail,
      'display_email': instance.displayEmail,
      'confirmed_at': instance.confirmedAt?.toIso8601String(),
      'password': instance.password,
      'role': _$RoleEnumMap[instance.role],
      'identities': instance.identities?.map((e) => e.toJson()).toList(),
      'entity': instance.entity?.toJson(),
      'entity_id': instance.entityId,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.admin: 'admin',
  Role.curator: 'curator',
  Role.contributor: 'contributor',
};
