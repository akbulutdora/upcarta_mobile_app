// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      text: json['text'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      contentID: json['contentID'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
      'username': instance.username,
      'contentID': instance.contentID,
    };
