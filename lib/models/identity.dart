import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';

part 'identity.freezed.dart';
part 'identity.g.dart';


enum Provider {@JsonValue('twitter') twitter, @JsonValue('email') email}

@freezed
class Identity with _$Identity {
  const factory Identity({
    required Provider provider,
    required String uid,
    String? email,
    String? name,
    String? phone,
    String? token,
    String? secret,
    User? user,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt
}) = _Identity;

factory Identity.fromJson(Map<String, Object?> json)
=> _$IdentityFromJson(json);
}