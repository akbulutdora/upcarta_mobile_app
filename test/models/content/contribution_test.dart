import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/content/content_link.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';


import '../../fixtures/fixture_reader.dart';

int main() {
  Contribution tContribution = Contribution(
      id: 1254,
      role: ContributionRole.author,
      content: null,
      contentId: 1279,
      entity: Entity(id: 19,
          name: 'David Perell',
          username: 'david_perell',
          description: "\"The Writing Guy\" | I tweet about writing, learning and business | My Podcast: https://t.co/1NhTBHcK8l | My writing school: https://t.co/bEFFy6bVaC",
          hasUser: false,
          followersCount: 2,
          followedEntitiesCount: 0,
          followedTopicsCount: 0,
          followedContentsCount: 0,
          addedBy: null,
          addedById: 1,
          twitter: 'david_perell',
          website: null,
          linkedin: null,
          wikipedia: null,
          followingEntity: null,
          channelEntities: null
      ),
      entityId: 19,
      pos: 1,
      addedBy: null,
      addedById: null
  );
  Contribution tContribution2 = Contribution.fromJson(json.decode(fixture('contribution.json')));
  print(tContribution2.toString());
  group('fromJson',(){
  test(
    'should return a valid Contribution',
    () async {
      //arrange
      String contributionFixture = fixture('contribution.json');
      final Map<String,dynamic> jsonMap = json.decode(contributionFixture);
      //act
      final result = Contribution.fromJson(jsonMap);
      //assert
      expect(result,tContribution);
    }
  );

  });
  group('toJson',(){
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tContribution.toJson();
        final real   = json.decode(fixture('contribution.json'));
        //assert
        expect(result,real);
      }
    );
  }
  );
  return
  0;
}