import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/content/content_link.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../shared_mocks.mocks.dart';

void main() {
  /// The mock Dio Client.
  MockDio mockDio = MockDio();
  when(mockDio.interceptors).thenAnswer((_) => Interceptors());

  String baseURL = 'https://upcarta-staging.onrender.com/api/v1';

  void clearInteractionsWithAll() {
    clearInteractions(mockDio);
  }

  group('requests with dio', () {
    RemoteDataSource dataSource2 = RemoteDataSource(dioClient: Dio());

    const tEmail = 'hello@upcarta.com';
    const tPassword = '12345678';

    test('should call login', () async {
      await dataSource2.login(email: tEmail, password: tPassword);
    });

    test('should call getEntityByID', () async {
      await dataSource2.getEntityWithId(2);
    });

    test('should call getAllContents', () async {
      final l = await dataSource2.getAllContents();
      // print(List<Content>.from(l!.map((model)=> Content.fromJson(model))));
      print(List<Content>.from(l!.map((model)=> Content.fromJson(model)))[0]);
    });

    test('should call unfollowEntityWithId', () async {
      await dataSource2.unfollowEntityWithId(2);
    });

    test('should call followEntityWithId', () async {
      await dataSource2.followEntityWithId(2);
    });

    test('should call getAllEntities', () async {
      final l = await dataSource2.getAllEntities();
      // print(List<Entity>.from(l!.map((model) => Entity.fromJson(model))));
    });
    test('should call getEntityFollowers', () async {
      final l = await dataSource2.getEntityFollowers(2);
    });
    test('should call getEntityFollowings', () async {
      final l = await dataSource2.getEntityFollowing(1);
      // print(List<Entity>.from(l!.map((model) => Entity.fromJson(model))));
    });
    test('should call createContent',()async{
      final tContentJson = json.decode(fixture('content.json'));
      final res = await dataSource2.createContent(tContentJson);
      print(res);
    });
    clearInteractionsWithAll();
  });

}
