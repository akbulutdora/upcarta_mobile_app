// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      text: json['text'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      date: DateTime.parse(json['date'] as String),
      isRead: json['isRead'] as bool,
    )..contentID = json['contentID'] as String;

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
      'username': instance.username,
      'date': instance.date.toIso8601String(),
      'contentID': instance.contentID,
      'isRead': instance.isRead,
    };
