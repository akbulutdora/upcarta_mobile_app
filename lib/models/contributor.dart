import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity.dart';

part 'contributor.freezed.dart';

part 'contributor.g.dart';

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
class Contributor with _$Contributor {
  const factory User({
    Role? role,
    Entity? entity,
  }) = _Contributor;

  factory Contributor.fromJson(Map<String, Object?> json) => _$ContributorFromJson(json);
}
