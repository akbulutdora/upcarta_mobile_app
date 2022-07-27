import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tEntity = Entity(
      id: null,
      name: 'Alican Vergin',
      username: 'alicanvergin',
      description: 'Upcarta Founder https://www.upcarta.com',
      hasUser: true,
      followersCount: 3,
      followedEntitiesCount: 8,
      followedTopicsCount: 4,
      followedContentsCount: null,
      twitter: null,
  );
  final tEntity2 = Entity.fromJson(json.decode(fixture('entity.json')));
  print(tEntity2.toString());

  group('fromJson',(){

  });
}
