// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Topic _$$_TopicFromJson(Map<String, dynamic> json) => _$_Topic(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String?,
      wikipedia: json['wikipedia'] as String?,
      slug: json['slug'] as String?,
      followersCount: json['followers_count'] as int?,
      contentsCount: json['contents_count'] as int?,
      addedBy: json['added_by'] == null
          ? null
          : User.fromJson(json['added_by'] as Map<String, dynamic>),
      addedById: json['added_by_id'] as int?,
      keywords: json['keywords'] as String?,
      insertedAt: json['inserted_at'] == null
          ? null
          : DateTime.parse(json['inserted_at'] as String),
    );

Map<String, dynamic> _$$_TopicToJson(_$_Topic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'wikipedia': instance.wikipedia,
      'slug': instance.slug,
      'followers_count': instance.followersCount,
      'contents_count': instance.contentsCount,
      'added_by': instance.addedBy,
      'added_by_id': instance.addedById,
      'keywords': instance.keywords,
      'inserted_at': instance.insertedAt?.toIso8601String(),
    };
