import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tUser = User(
      id: null,
      email: 'hello@upcarta.com',
      unconfirmedEmail: null,
      displayEmail: null,
      confirmedAt: DateTime.parse('2021-04-14 08:16:52.966580Z'),
      password: null,
      role: Role.user,
      identities: [],
      entity: const Entity(
          id: null,
          name: 'Hello',
          username: 'helloupcarta',
          description: null,
          hasUser: true,
          followersCount: 0,
          followedEntitiesCount: 0,
          followedTopicsCount: 0,
          followedContentsCount: 0,
          addedBy: null,
          addedById: null,
          twitter: null,
          website: null,
          linkedin: null,
          wikipedia: null,
          followingEntity: null,
          channelEntities: null),
      entityId: null);

  test(
    'should be a subclass of User entity',
        () async {
      // assert
      expect(tUser, isA<User>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid User model when the JSON is a proper User',
          () async {
        // arrange
        String userFixture = fixture('user.json');

        final Map<String, dynamic> jsonMap = json.decode(userFixture);
        // act
        final result = User.fromJson(jsonMap);
        // assert
        expect(result, tUser);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
        final result = tUser.toJson();
        // result.removeWhere((key, value) => value == null);
        // assert
        print(tUser.toString());
        expect(result, json.decode(fixture('user.json')));
      },
    );
  });
}