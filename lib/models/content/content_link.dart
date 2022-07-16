import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/content/platform.dart';

part 'content_link.freezed.dart';

part 'content_link.g.dart';

enum LinkType{
  @JsonValue('resource')
  resource,
  @JsonValue('content')
  content,
  @JsonValue('channel')
  channel,
  @JsonValue('playlist')
  playlist,
  @JsonValue('episode')
  episode,
  @JsonValue('video')
  video,
  @JsonValue('audio')
  audio,
}
// TODO: createdataccuracy content modelinde de tanimlandi ve o modeli importluyorum bir cakisma olur mu(ikisi de ayni sey aslinda)
enum CreatedAtAccuracy{
  @JsonValue('year')
  year,
  @JsonValue('month')
  month,
  @JsonValue('day')
  day,
  @JsonValue('hour')
  hour,
}

@freezed
class ContentLink with _$ContentLink {
  const factory ContentLink({
    int? id,
    required String link,
    String? title,
    String? description,
    String? slug,
    @JsonKey(name: 'status_code')   int? statusCode,
    @JsonKey(name: 'source_id')     String? sourceId,
    @JsonKey(name: 'alt_source_id') String? altSourceId,
    @JsonKey(name: 'platform_id')     int? platformId,
    Platform? platform,
    LinkType? type,
    Content? content,
    @JsonKey(name: 'content_id') int? contentId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'created_at_accuracy') CreatedAtAccuracy? createdAtAccuracy,
    @JsonKey(name: 'created_at_str') String? createdAtStr,
    int? pos,
    @JsonKey(name: 'synced_at') DateTime? syncedAt,
  }) = _ContentLink;

  factory ContentLink.fromJson(Map<String, Object?> json) => _$ContentLinkFromJson(json);
}
