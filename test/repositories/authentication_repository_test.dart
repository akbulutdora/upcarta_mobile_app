import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';

@GenerateMocks([NetworkInfo, RemoteDataSource, LocalDataStorage])
import 'authentication_repository_test.mocks.dart';

// class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockLocalDataStorage mockLocalDataStorage = MockLocalDataStorage();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  AuthenticationRepository repository = AuthenticationRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataStorage: mockLocalDataStorage,
      networkInfo: mockNetworkInfo);

  const tEmail = 'hello@upcarta.com';
  const tPassword = '12345678';
  const tUser = User(email: 'hello@upcarta.com');
  const tToken =
      'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzcG90YWJsZSIsImV4cCI6MTY1OTc3NTUyMiwiaWF0IjoxNjU3MzU2MzIyLCJpc3MiOiJzcG90YWJsZSIsImp0aSI6ImRhNWI1ZjQ4LWZiNzAtNDE3Mi1iYzY1LWM4YWYzNzAwNDgzNiIsIm5iZiI6MTY1NzM1NjMyMSwic3ViIjoiMSIsInR5cCI6ImFjY2VzcyJ9.yYEFOUcEjP34cbkmDy88-wKUF-2VbVO0phn7Vc3vKUtANO329rFdb5nuPvwi1ixBOn30AqZ4tZ71iKAoQTVkPQ';

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

  group('authenticate', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.authenticate(
          email: tEmail, password: tPassword))
          .thenAnswer((_) async => tToken);
      // act
      repository.authenticate(tEmail, tPassword);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.authenticate(
              email: tEmail, password: tPassword))
              .thenAnswer((_) async => tToken);
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verify(mockRemoteDataSource.authenticate(
              email: tEmail, password: tPassword));
          expect(result, equals(const Right(tToken)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.authenticate(
              email: anyNamed('email'), password: anyNamed('password')))
              .thenAnswer((_) async => tToken);
          // act
          await repository.authenticate(tEmail, tPassword);
          // assert
          verify(mockRemoteDataSource.authenticate(
              email: tEmail, password: tPassword));
          verify(mockLocalDataStorage.cacheUserToken(tToken));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.authenticate(
              email: anyNamed('email'), password: anyNamed('password')))
              .thenThrow(ServerException());
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verify(mockRemoteDataSource.authenticate(
              email: tEmail, password: tPassword));
          // verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataStorage.getUserToken())
              .thenAnswer((_) async => tToken);
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verify(mockLocalDataStorage.getUserToken());
          expect(result, equals(const Right(tToken)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataStorage.getUserToken()).thenThrow(CacheException());
          // act
          final result = await repository.authenticate(tEmail, tPassword);
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verify(mockLocalDataStorage.getUserToken());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });

  });
}
