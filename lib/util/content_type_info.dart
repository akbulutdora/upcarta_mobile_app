import 'package:flutter/material.dart';
import 'package:upcarta_mobile_app/models/content.dart';

Map<ContentType, List> contentTypeInfoDict = {
  ContentType.video: [Icons.ondemand_video_sharp, 'Video'],
  ContentType.article: [Icons.ondemand_video_sharp, 'Article'],
  ContentType.podcastEpisode: [Icons.ondemand_video_sharp, 'Podcast Episode'],
  ContentType.book: [Icons.menu_book_sharp, 'Book'],
  ContentType.course: [Icons.ondemand_video_sharp, 'Course'],
  ContentType.tweet: [Icons.ondemand_video_sharp, 'Tweet'],
  ContentType.presentation: [Icons.ondemand_video_sharp, 'Presentation'],
  ContentType.paper: [Icons.ondemand_video_sharp, 'Paper'],
  ContentType.audio: [Icons.ondemand_video_sharp, 'Audio'],
  ContentType.documentary: [Icons.ondemand_video_sharp, 'Documentary'],
  ContentType.website: [Icons.ondemand_video_sharp, 'Website'],
  ContentType.report: [Icons.ondemand_video_sharp, 'Report'],
  ContentType.transcript: [Icons.ondemand_video_sharp, 'Transcript'],
  ContentType.forumPost: [Icons.ondemand_video_sharp, 'Forum Post'],
  ContentType.movie: [Icons.ondemand_video_sharp, 'Movie'],
  ContentType.series: [Icons.ondemand_video_sharp, 'Series'],
  ContentType.channel: [Icons.ondemand_video_sharp, 'Channel'],
  ContentType.blog: [Icons.ondemand_video_sharp, 'Blog'],
  ContentType.newsletter: [Icons.ondemand_video_sharp, 'Newsletter'],
  ContentType.podcast: [Icons.ondemand_video_sharp, 'Podcast'],
  ContentType.tvEpisode: [
    Icons.ondemand_video_sharp,
    'TV Episode',
  ]
};
