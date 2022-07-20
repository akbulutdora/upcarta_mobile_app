import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/identity.dart';

part 'upcarta_user.freezed.dart';

part 'upcarta_user.g.dart';

enum Role {
  @JsonValue('user')
  user,
  @JsonValue('admin')
  admin,
  @JsonValue('curator')
  curator,
  @JsonValue('contributor')
  contributor
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    required String email,
    @JsonKey(name: 'unconfirmed_email') String? unconfirmedEmail,
    @JsonKey(name: 'display_email') String? displayEmail,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    String? password,
    Role? role,
    List<Identity>? identities,
    Entity? entity,
    //todo : relational required
    @JsonKey(name: 'entity_id') int? entityId
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
