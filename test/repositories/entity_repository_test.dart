import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/entity_repository/entity_repository.dart';
import '../fixtures/fixture_reader.dart';
import '../shared_mocks.mocks.dart';

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockLocalDataStorage mockLocalDataStorage = MockLocalDataStorage();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  EntityRepository repository = EntityRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataStorage: mockLocalDataStorage,
      networkInfo: mockNetworkInfo);

  void clearInteractionsWithAll() {
    clearInteractions(mockNetworkInfo);
    clearInteractions(mockLocalDataStorage);
    clearInteractions(mockRemoteDataSource);
  }

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  final Map<String, dynamic> dioResponse =
      json.decode(fixture('show_entity_success_response.json'));
  const tId = 233;
  const tToken =
      'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzcG90YWJsZSIsImV4cCI6MTY1OTc3NTUyMiwiaWF0IjoxNjU3MzU2MzIyLCJpc3MiOiJzcG90YWJsZSIsImp0aSI6ImRhNWI1ZjQ4LWZiNzAtNDE3Mi1iYzY1LWM4YWYzNzAwNDgzNiIsIm5iZiI6MTY1NzM1NjMyMSwic3ViIjoiMSIsInR5cCI6ImFjY2VzcyJ9.yYEFOUcEjP34cbkmDy88-wKUF-2VbVO0phn7Vc3vKUtANO329rFdb5nuPvwi1ixBOn30AqZ4tZ71iKAoQTVkPQ';
  const Entity tEntity = Entity(
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

  group('getEntityById', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getEntityById(tId))
          .thenAnswer((_) async => dioResponse['data']);
      // act
      repository.getEntityWithId(token: tToken, id: tId);
      // assert
      verify(mockNetworkInfo.isConnected);

      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getEntityById(tId))
              .thenAnswer((_) async => dioResponse['data']);
          // act
          final result =
              await repository.getEntityWithId(token: tToken, id: tId);
          // assert
          verify(mockRemoteDataSource.getEntityById(tId));
          expect(result, equals(const Right(tEntity)));

          clearInteractionsWithAll();
        },
      );

      // test(
      //   'should cache the data locally when the call to remote data source is successful',
      //       () async {
      //     // arrange
      //     when(mockRemoteDataSource.authenticate(
      //         email: anyNamed('email'), password: anyNamed('password')))
      //         .thenAnswer((_) async => tEntity);
      //     // act
      //     await repository.authenticate(tEmail, tPassword);
      //     // assert
      //     verify(mockRemoteDataSource.authenticate(
      //         email: tEmail, password: tPassword));
      //     verify(mockLocalDataStorage.cacheUserToken(tToken));
      //     verify(mockLocalDataStorage.cacheUser(tUser));
      //
      //     clearInteractionsWithAll();
      //
      //   },
      // );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getEntityById(any))
              .thenThrow(ServerException());
          // act
          final result =
              await repository.getEntityWithId(token: tToken, id: tId);
          // assert
          verify(mockRemoteDataSource.getEntityById(tId));
          // verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });

    // FIXME: Mock Local Data Storage interacts
    runTestsOffline(() {
      test(
        'should return server failure when there is no connection',
        () async {
          // arrange
          // when(mockLocalDataStorage.getUserToken())
          //     .thenAnswer((_) async => tToken);
          // act
          final result =
              await repository.getEntityWithId(token: tToken, id: tId);
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verifyNoMoreInteractions(mockLocalDataStorage);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });
  });
}
