import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tUser = User(
      id: null,
      email: 'hello@upcarta.com',
      unconfirmedEmail: null,
      displayEmail: null,
      password: null,
      role: Role.user,
      identities: [],
      entity: Entity(
          id: null,
          name: 'Hello',
          username: 'helloupcarta',
          description: null,
          user: null,
          hasUser: true,
          followersCount: 0,
          followedEntitiesCount: 0,
          followedTopicsCount: 0,
          addedContentsCount: null,
          followedContentsCount: 0,
          twitter: null,
          twitterID: null,
          featuredAt: null,
          insertedAt: null,
          updatedAt: null),
      entityId: null);

  User tUser2 = User.fromJson(json.decode(fixture('user.json')));
  print(tUser2.toString());

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
        // assert
        final expectedJsonMap = {
          'email': 'hello@upcarta.com',
          'unconfirmed_email': null,
          'display_email': null,
          'password': null,
          'role': null,
          'identities': null,
          'entity': null
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
