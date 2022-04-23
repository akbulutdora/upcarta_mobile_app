import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";
@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final int followers;
  final int following;
  final String password_hash;
  final String confirmation_sent_at;
  final String confirmed_at;
  final String confirmation_token;
  final String reset_password_token;
  final String reset_password_sent_at;
  final String avatar;
  final String bio;
  final bool darkMode;

  User({
    required this.username,
    required this.id,
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    this.password_hash = "",
    this.confirmation_sent_at = "",
    this.confirmed_at = "",
    this.confirmation_token = "",
    this.reset_password_token = "",
    this.reset_password_sent_at = "",
    required this.avatar,
    required this.bio,
    required this.darkMode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
