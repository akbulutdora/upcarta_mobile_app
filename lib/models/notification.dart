import 'package:json_annotation/json_annotation.dart';

part "notification.g.dart";

@JsonSerializable()
class Notification {
  final String text;
  final String image;
  final String username;
  final String contentID;
  final DateTime date;
  bool isRead;

  Notification(
      {required this.text,
      required this.image,
      required this.username,
      required this.contentID,
      required this.date,
      required this.isRead});

  void markAsRead() {
    isRead = true;
  }

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
