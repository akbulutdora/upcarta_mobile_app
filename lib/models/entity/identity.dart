import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

part 'identity.freezed.dart';
part 'identity.g.dart';


enum Provider {@JsonValue('twitter') twitter, @JsonValue('email') email}

@freezed
class Identity with _$Identity {
  const factory Identity({
    int? id,
    /// Authentication provider twitter/email
    required Provider provider,
    /// source user id from the external oauth provider
    required String uid,
    /// source email from the external oauth provider
    String? email,
    /// source name from the external oauth provider
    String? name,
    /// source phone from the external oauth provider
    String? phone,
    /// token returned from the oauth provider
    String? token,
    /// secret returned from the oauth provider
    String? secret,
    User? user,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt
}) = _Identity;

factory Identity.fromJson(Map<String, Object?> json)
=> _$IdentityFromJson(json);
}