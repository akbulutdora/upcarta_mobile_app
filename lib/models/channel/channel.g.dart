// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Channel _$$_ChannelFromJson(Map<String, dynamic> json) => _$_Channel(
      id: json['id'] as int?,
      link: json['link'] as String,
      channelEntities: (json['channel_entities'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'channel_entities':
          instance.channelEntities?.map((e) => e.toJson()).toList(),
      'type': _$ChannelTypeEnumMap[instance.type],
    };

const _$ChannelTypeEnumMap = {
  ChannelType.video: 'video',
  ChannelType.article: 'article',
  ChannelType.podcastEpisode: 'podcast_episode',
  ChannelType.book: 'book',
  ChannelType.course: 'course',
  ChannelType.tweet: 'tweet',
  ChannelType.presentation: 'presentation',
  ChannelType.paper: 'paper',
  ChannelType.audio: 'audio',
  ChannelType.documentary: 'documentary',
  ChannelType.website: 'website',
  ChannelType.report: 'report',
  ChannelType.transcript: 'transcript',
  ChannelType.forumPost: 'forum_post',
  ChannelType.movie: 'movie',
  ChannelType.series: 'series',
  ChannelType.channel: 'channel',
  ChannelType.blog: 'blog',
  ChannelType.newsletter: 'newsletter',
  ChannelType.podcast: 'podcast',
  ChannelType.tvEpisode: 'tv_episode',
};
