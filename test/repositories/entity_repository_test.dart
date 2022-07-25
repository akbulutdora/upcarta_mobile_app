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

  group('getEntityWithId', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
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
    const tId = 233;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getEntityWithId(tId))
          .thenAnswer((_) async => dioResponse['data']);
      // act
      repository.getEntityWithId(id: tId);
      // assert
      verify(mockNetworkInfo.isConnected);

      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should make the call to remote data source successfully',
        () async {
          // arrange
          when(mockRemoteDataSource.getEntityWithId(tId))
              .thenAnswer((_) async => dioResponse['data']);
          // act
          await repository.getEntityWithId(id: tId);
          // assert
          verify(mockRemoteDataSource.getEntityWithId(tId));
          clearInteractionsWithAll();
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getEntityWithId(tId))
              .thenAnswer((_) async => dioResponse['data']);
          // act
          final result = await repository.getEntityWithId(id: tId);
          // assert
          verify(mockRemoteDataSource.getEntityWithId(tId));
          expect(result, equals(const Right(tEntity)));

          clearInteractionsWithAll();
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getEntityWithId(any))
              .thenThrow(ServerException());
          // act
          final result = await repository.getEntityWithId(id: tId);
          // assert
          verify(mockRemoteDataSource.getEntityWithId(tId));
          // verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return server failure when there is no connection',
        () async {
          // act
          final result = await repository.getEntityWithId(id: tId);
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verifyNoMoreInteractions(mockLocalDataStorage);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });
  });

  group('followEntityWithId', () {
    const tId = 1;
    runTestsOnline(() {
      test(
        'should make the call to remote data source successfully',
            () async {
          // arrange
          when(mockRemoteDataSource.followEntityWithId(tId))
              .thenAnswer((_) async => dioResponse['data']);
          // act
          await repository.followEntityWithId(tId);
          // assert
          verify(mockRemoteDataSource.followEntityWithId(tId));
          clearInteractionsWithAll();
        },
      );
    });

    test(
      'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.followEntityWithId(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.followEntityWithId(tId);
        // assert
        verify(mockRemoteDataSource.followEntityWithId(tId));
        // verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));

        clearInteractionsWithAll();
      },
    );
  });
}
