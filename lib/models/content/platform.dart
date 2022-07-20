import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
//semasi dokumantasyondan cikarilmis
part 'platform.freezed.dart';

part 'platform.g.dart';


@freezed
class Platform with _$Platform {
  const factory Platform({
    /// primary key
    int? id,
    required String link,
    /// host of the url
    String? host,
  }) = _Platform;

  factory Platform.fromJson(Map<String, Object?> json) => _$PlatformFromJson(json);
}
