import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/details.dart';
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
enum ContentLinkCreatedAtAccuracy{
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

    /// URL of the resource
    required String link,

    /// relational content
    Content? content,
    /// relational content id
    @JsonKey(name: 'content_id') int? contentId,

    /// position for appearance
    int? pos,

    String? body,
    @JsonKey(name: 'has_embed') bool? hasEmbed,
    @JsonKey(name: 'has_ratings') bool? hasRatings,
    @JsonKey(name: 'episode_number') int? episodeNumber,
    int? duration,
    //todo: details
    Details? details


  }) = _ContentLink;

  factory ContentLink.fromJson(Map<String, Object?> json) => _$ContentLinkFromJson(json);
}
