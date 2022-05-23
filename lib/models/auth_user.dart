import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "auth_user.g.dart";

@JsonSerializable()
class AuthUser extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photoURL;

  const AuthUser({
    required this.id,
    this.name,
    this.email,
    this.photoURL,
  });

  static const empty = AuthUser(
    id: "",
    name: "",
    photoURL: "",
    email: "",
  );

  bool get isEmpty => this == AuthUser.empty;
  bool get isNotEmpty => this != AuthUser.empty;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        photoURL,
        email,
      ];
}
