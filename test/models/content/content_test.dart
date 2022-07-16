import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/content/content_link.dart';
import 'package:upcarta_mobile_app/models/content/content_topic.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/content/topic.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

void main() {
  final tContent = Content(
      title: 'Seeing at the Speed of Sound',
      description:
          "That's the title of a lovely piece by Stanford graduate Rachel Kolb about what it's like for a deaf person to try to lipread.Lipreading, on which I rely for most social interaction, is an inherently tenuous mode of communication. It's essentially a skill of trying to grasp with on...",
      contributions: [
        const Contribution(
            pos: 1,
            role: ContributionRole.author,
            entity: Entity(
                name: 'Eugene Wei',
                username: 'EugeneWei',
                hasUser: false,
                followersCount: 0,
                followedEntitiesCount: 0,
                followedContentsCount: 0,
                followedTopicsCount: 0),
            // todo : jsonda bunlar yok
            entityId: 13,
            contentId: 123)
      ],
      contentLinks: [
        const ContentLink(
          link:
              'https://www.eugenewei.com/blog/2013/3/9/seeing-at-the-speed-of-sound',
          pos: null,
        )
      ],
      contentTopics: [
        const ContentTopic(
            // todo : jsonda yok bunlar ekle
            contentId: 123,
            topicId: 123,
            pos: 1,
            topic: Topic(
              title: 'Startup',
              id: 15,
              slug: 'startup',
              contentsCount: 5,
              //topic olarak girilen json dosyasinda olan
              //fieldlar documentasyonda yok
              //contributorsCount: 0
              //followersCount : 0
              //image :null
            )),
        const ContentTopic(
          // todo : jsonda yok bunlar ekle
            contentId: 1234,
            topicId: 1234,
            pos: 2,
            topic: Topic(
              title: 'Business',
              id: 13,
              slug: 'business',
              contentsCount: 1,
              //topic olarak girilen json dosyasinda olan
              //fieldlar documentasyonda yok
              //contributorsCount: 0
              //followersCount : 0
              //image :null
            )),
      ],
    createdAt: DateTime.parse('2013-03-09T20:58:51Z'),
    createdAtAccuracy: CreatedAtAccuracy.hour,
    type : Type.article,
    //documantasyonda yok json valuda var
    // image : null
  );

  test(
    'should be a subclass of User entity',
    () async {
      // assert
      expect(tContent, isA<Content>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid upcarta_content model when the JSON is a proper content',
      () async {
        // arrange
        String fixture =
            File('test/fixtures/test_content.json').readAsStringSync();
        final Map<String, dynamic> jsonMap = json.decode(fixture);
        // act
        final result = Content.fromJson(jsonMap);
        // assert
        expect(result, tContent);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tContent.toJson();
        // assert
        final expectedJsonMap = {
          "id" : null,
          "title": "Seeing at the Speed of Sound",
          "description": "That's the title of a lovely piece by Stanford graduate Rachel Kolb about what it's like for a deaf person to try to lipread.Lipreading, on which I rely for most social interaction, is an inherently tenuous mode of communication. It's essentially a skill of trying to grasp with on...",
          "content_details" : null,
          "added_by" : null,
          "added_by_id" : null,
          "content_links_count" : null,
          "recommenders_count" : null,
          "followers_count" : null,
          "featured_at" : null,
          "inserted_at" : null,
          "updated_at"  : null,
          "contributions": [
            {
              "id" : null,
              "content" : null,
              "added_by" : null,
              "added_by_id" : null,
              "inserted_at" : null,
              "updated_at"  : null,
              //todo:entity id required ama jsonda yok
              "entity_id" :123,
              //todo:content id required ama jsonda yok
              "content_id":321,

              "pos": 1,
              "role": "author",
              "entity": {
                "id" : null,
                "name": "Eugene Wei",
                "description": null,
                "username": "EugeneWei",
                "user" : null,
                //jsonda var dokumantasyonda yok
                //"avatar": null,
                //"wikipedia": null,
                //"linkedin": null,
                //"website": null,
                "twitter": null,
                "twitter_id": null,
                "has_user": false,
                "followers_count": 0,
                "followed_entities_count": 0,
                "followed_contents_count": 0,
                "followed_topics_count": 0,
                "added_contents_count": 0,
                "featured_at" : null,
                "inserted_at" : null,
                "updated_at"  : null,
              }
            }
          ],
          "content_links": [
            {
              "id" : null,
              "link": "https://www.eugenewei.com/blog/2013/3/9/seeing-at-the-speed-of-sound",
              "title" : null,
              "pos": null,
              "slug" : null,
              "description" : null,
              "status_code" : null,
              "source_id" : null,
              "alt_source_id" : null,
              "platform_id" : null,
              "platform" : null,
              "type" : null,
              "content" : null,
              "content_id" : null,
              "created_at" : null,
              "created_at_accuracy" : null,
              "created_at_str" : null,
              "synced_at" : null
            }
          ],
          "content_topics": [
            {
              "id": null,
              "content" : null,
              "content_id" : null,
              "topic_id" : null,
              "added_by" : null,
              "added_by_id" : null,
              "inserted_at" : null,
              "updated_at" : null,
              "pos": 1,
              "topic": {
                "title": "Startup",
                "wikipedia": null,
                "id": 15,
                "description": null,
                "slug": "startup",
                "contents_count": 5,
                "followers_count": 0,
                "keywords" : null,
                "added_by" : null,
                "added_by_id" : null,
                "inserted_at" : null,
                "updated_at" : null,
                //todo : jsonda var dokumantasyonda yok
                //"contributors_count": 0,
                //"image": null
              }
            },
            {
              "pos": 2,
              "topic": {
                "title": "Business",
                "wikipedia": null,
                "id": 13,
                "description": null,
                "slug": "business",
                "contents_count": 1,
                "followers_count": 0,
                "keywords" : null,
                "added_by" : null,
                "added_by_id" : null,
                "inserted_at" : null,
                "updated_at" : null,
                //todo : jsonda var dokumantasyonda yok
                //"image": null
                //"contributors_count": 0,
              }
            }
          ],
          "created_at": "2013-03-09T20:58:51Z",
          "created_at_accuracy": "hour",
          "type": "article",
          //todo : jsonda var dokumantasyonda yok
          //"image": null
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
