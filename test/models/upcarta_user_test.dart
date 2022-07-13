import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';

void main() {
  const tUser = User(email: 'hello@upcarta.com');

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
        String fixture = File('test/fixtures/test_user.json').readAsStringSync();
        final Map<String, dynamic> jsonMap =
            json.decode(fixture);
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
          'email' : 'hello@upcarta.com',
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
