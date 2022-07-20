import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/content/content_link.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final Content tContent = Content(
    id: null,
    title: 'Adulting Fast and Slow',
    description: 'We live in a society of adult-like children and childish adults. Kids have never had more information at their fingertips, so they’re growing up faster than ever. From a young age, they can watch violent war clips on YouTube, Dan Bilzerian videos on Instagram, and Shakira getting...',
    slug: 'adulting-fast-and-slow',
    type: Type.article,
    parent: null,
    children: null,
    addedBy: null,
    addedById: null,
    contentTopics: [],
    contributions: [
      const Contribution(id: null,
          role: ContributionRole.author,
          content: null,
          contentId: 1279,
          entity: Entity(id: null,
              name: 'David Perell',
              username: 'david_perell',
              description: '\"The Writing Guy\" | I tweet about writing, learning and business | My Podcast: https://t.co/1NhTBHcK8l | My writing school: https://t.co/bEFFy6bVaC',
              user: null,
              hasUser: false,
              followersCount: 2,
              followedEntitiesCount: 0,
              followedTopicsCount: 0,
              addedContentsCount: null,
              followedContentsCount: 0,
              twitter: 'david_perell',
              twitterID: 240049622,
              featuredAt: null,
              insertedAt: null,
              updatedAt: null),
          entityId: 19,
          pos: 1,
          addedBy: null,
          addedById: null)
    ],
    contentLinks: [
      const ContentLink(id: null,
          link: 'https://perell.com/essay/adulting-fast-and-slow/',
          content: null,
          contentId: null,
          pos: null,
          body: null,
          hasEmbed: null,
          hasRatings: null,
          episodeNumber: null,
          duration: null,
          details: null)
    ],
    contentLinksCount: null,
    recommendersCount: null,
    followersCount: null,
    publicCollectionsCount: 0,
    featuredRecommendersCount: 0,
    contextRecommendersCount: 0,
    createdAt: DateTime.parse('2020-04-07T20:19:04Z'),
    createdAtAccuracy: CreatedAtAccuracy.hour,
    followable: null,
    personalCurations: null,
    featuredAt: null,
    insertedAt: DateTime.parse('2021-03-30T20:06:25.678846Z'),
    updatedAt: null,
  );

  Content tContent2 = Content.fromJson(json.decode(fixture('content.json')));
  print(tContent2.toString());
  if(tContent2.toString() == tContent.toString()) print('olmus');
}
