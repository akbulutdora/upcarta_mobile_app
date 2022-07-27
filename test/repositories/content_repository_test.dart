import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/content_repository/content_repository.dart';
import 'package:upcarta_mobile_app/models/content/content_link.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

import '../fixtures/fixture_reader.dart';
import '../shared_mocks.mocks.dart';

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockLocalDataStorage mockLocalDataStorage = MockLocalDataStorage();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  ContentRepository repository = ContentRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataStorage: mockLocalDataStorage,
      networkInfo: mockNetworkInfo);

  const tUser = User(email: 'hello@upcarta.com');
  const tToken =
      'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzcG90YWJsZSIsImV4cCI6MTY1OTc3NTUyMiwiaWF0IjoxNjU3MzU2MzIyLCJpc3MiOiJzcG90YWJsZSIsImp0aSI6ImRhNWI1ZjQ4LWZiNzAtNDE3Mi1iYzY1LWM4YWYzNzAwNDgzNiIsIm5iZiI6MTY1NzM1NjMyMSwic3ViIjoiMSIsInR5cCI6ImFjY2VzcyJ9.yYEFOUcEjP34cbkmDy88-wKUF-2VbVO0phn7Vc3vKUtANO329rFdb5nuPvwi1ixBOn30AqZ4tZ71iKAoQTVkPQ';
  //final List<Content> tAllContents = <Content>[];
  final tContentsResponse = json.decode(fixture('content_list.json'))['data'];

  final tAllContents = List<Content>.from(tContentsResponse!.map((model)=>Content.fromJson(model)));


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

  group('getAllContents', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllContents())
          .thenAnswer((_) async => tContentsResponse);
      // act
      repository.getAllContents();
      // assert
      verify(mockNetworkInfo.isConnected);
      //clear
      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllContents())
              .thenAnswer((_) async => tContentsResponse);
          // act

          final result = await repository.getAllContents();
          // assert
          verify(mockRemoteDataSource.getAllContents());
          expect(result, equals(Right(tAllContents)));
          //clear
          clearInteractionsWithAll();
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllContents())
              .thenAnswer((_) async => tContentsResponse);
          // act
          await repository.getAllContents();
          // assert
          verify(mockRemoteDataSource.getAllContents());
          //TODO: UPDATE
          // verify(mockLocalDataStorage.cacheUserToken(tToken));
          //clear
          clearInteractionsWithAll();
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllContents())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllContents();
          // assert
          verify(mockRemoteDataSource.getAllContents());
          // verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
          //clear
          clearInteractionsWithAll();
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return server failure when there is no connection',
        () async {
          // arrange

          // act
          final result = await repository.getAllContents();
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verifyNoMoreInteractions(mockLocalDataStorage);
          expect(result, equals(Left(ServerFailure())));
          //clear
          clearInteractionsWithAll();
        },
      );
    });
  });
}
