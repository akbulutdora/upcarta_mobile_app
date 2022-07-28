import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tEntity = Entity(
      id: 233,
      name: 'Test 123',
      username: 'Test1232',
      description: null,
      hasUser: false,
      followersCount: 0,
      followedEntitiesCount: 0,
      followedTopicsCount: 0,
      followedContentsCount: 0,
      addedBy: null,
      addedById: 44,
      twitter: null,
      website: null,
      linkedin: null,
      wikipedia: null,
      followingEntity: null,
      channelEntities: null);

  group('fromJson', () {
    test(
      'should return a valid model when the JSON data is an Entity',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('show_entity_success_response.json'))['data'];
        // act
        final result = Entity.fromJson(jsonMap);
        // assert
        expect(result, tEntity);
      },
    );
  });
}
