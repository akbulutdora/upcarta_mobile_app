import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/identity.dart';

part 'channel.freezed.dart';

part 'channel.g.dart';
//contenttype ile ayni
enum ChannelType {
  @JsonValue('video')
  video,
  @JsonValue('article')
  article,
  @JsonValue('podcast_episode')
  podcastEpisode,
  @JsonValue('book')
  book,
  @JsonValue('course')
  course,
  @JsonValue('tweet')
  tweet,
  @JsonValue('presentation')
  presentation,
  @JsonValue('paper')
  paper,
  @JsonValue('audio')
  audio,
  @JsonValue('documentary')
  documentary,
  @JsonValue('website')
  website,
  @JsonValue('report')
  report,
  @JsonValue('transcript')
  transcript,
  @JsonValue('forum_post')
  forumPost,
  @JsonValue('movie')
  movie,
  @JsonValue('series')
  series,
  @JsonValue('channel')
  channel,
  @JsonValue('blog')
  blog,
  @JsonValue('newsletter')
  newsletter,
  @JsonValue('podcast')
  podcast,
  @JsonValue('tv_episode')
  tvEpisode,
}

@freezed
class Channel with _$Channel {
  const factory Channel({
    int? id,
    required String link,
    @JsonKey(name: 'channel_entities') List<Entity>? channelEntities,
    ChannelType? type,

  }) = _Channel;

  factory Channel.fromJson(Map<String, Object?> json) => _$ChannelFromJson(json);
}
