import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/repositories/collection_repository/collection_repository.dart';
import '../fixtures/fixture_reader.dart';
import '../shared_mocks.mocks.dart';

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockLocalDataStorage mockLocalDataStorage = MockLocalDataStorage();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  CollectionRepository repository = CollectionRepository(
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

  group('getAllCollections', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    final tCollection = Collection(
        id: 1,
        title: 'Saved For Later',
        entityId: 1,
        entity: const Entity(
            id: 1,
            name: 'hello',
            username: 'hello',
            description: null,
            hasUser: true,
            followersCount: 0,
            followedEntitiesCount: 1,
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
        addedBy: null,
        addedById: null,
        description: null,
        slug: 'saved-for-later',
        type: CollectionType.later,
        sort: null,
        createdAtStr: '2022-07-09 08:28:37',
        createdAt: DateTime.parse('2022-07-09 08:28:37.000Z'),
        createdAtAccuracy: CollectionCreatedAtAccuracy.hour,
        link: null,
        sourceContent: null,
        sourceContentId: null,
        visibility: null,
        verifiedAt: null,
        featuredAt: null,
        recommended: null,
        publishedAt: null,
        collectionTopics: null,
        insertedAt: DateTime.parse('2022-07-09 08:28:37.720780Z'));
    final List dioResponse =
    json.decode(fixture('collection_list_success_response.json'));
    final tCollectionList = List<Collection>.from(
        dioResponse.map((model) => Collection.fromJson(model)));

    const tId = 1;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllCollections())
          .thenAnswer((_) async => dioResponse);
      // act
      repository.getAllCollections();
      // assert
      verify(mockNetworkInfo.isConnected);

      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should make the call to remote data source successfully',
            () async {
          // arrange
          when(mockRemoteDataSource.getAllCollections())
              .thenAnswer((_) async => dioResponse);
          // act
          await repository.getAllCollections();
          // assert
          verify(mockRemoteDataSource.getAllCollections());
          clearInteractionsWithAll();
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getAllCollections())
              .thenAnswer((_) async => dioResponse);
          // act
          final result = await repository.getAllCollections();
          // assert
          verify(mockRemoteDataSource.getAllCollections());
          expect(result.fold((l) => l, (r) => r), equals(tCollectionList));

          clearInteractionsWithAll();
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getAllCollections())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllCollections();
          // assert
          verify(mockRemoteDataSource.getAllCollections());
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
          final result = await repository.getAllCollections();
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verifyNoMoreInteractions(mockLocalDataStorage);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });
  });

  group('getCollectionWithId', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    final tCollection = Collection(
        id: 1,
        title: 'Saved For Later',
        entityId: 1,
        entity: const Entity(
            id: 1,
            name: 'hello',
            username: 'hello',
            description: null,
            hasUser: true,
            followersCount: 0,
            followedEntitiesCount: 1,
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
        addedBy: null,
        addedById: null,
        description: null,
        slug: 'saved-for-later',
        type: CollectionType.later,
        sort: null,
        createdAtStr: '2022-07-09 08:28:37',
        createdAt: DateTime.parse('2022-07-09 08:28:37.000Z'),
        createdAtAccuracy: CollectionCreatedAtAccuracy.hour,
        link: null,
        sourceContent: null,
        sourceContentId: null,
        visibility: null,
        verifiedAt: null,
        featuredAt: null,
        recommended: null,
        publishedAt: null,
        collectionTopics: null,
        insertedAt: DateTime.parse('2022-07-09 08:28:37.720780Z'));
    final Map<String, dynamic> dioResponse = {
      'added_by_id': null,
      'contents_count': 1,
      'created_at': '2022-07-09T08:28:37Z',
      'created_at_accuracy': 'hour',
      'created_at_str': '2022-07-09 08:28:37',
      'description': null,
      'entity': {
        'added_by_id': null,
        'description': null,
        'followed_contents_count': 0,
        'followed_entities_count': 1,
        'followed_topics_count': 0,
        'followers_count': 0,
        'following_entity': null,
        'has_user': true,
        'id': 1,
        'linkedin': null,
        'name': 'hello',
        'twitter': null,
        'username': 'hello',
        'website': null,
        'wikipedia': null
      },
      'entity_id': 1,
      'followers_count': 0,
      'id': 1,
      'inserted_at': '2022-07-09T08:28:37.720780Z',
      'link': null,
      'slug': 'saved-for-later',
      'title': 'Saved For Later',
      'type': 'later'
    };
    const tId = 1;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getCollectionWithId(tId))
          .thenAnswer((_) async => dioResponse);
      // act
      repository.getCollectionWithId(tId);
      // assert
      verify(mockNetworkInfo.isConnected);

      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should make the call to remote data source successfully',
            () async {
          // arrange
          when(mockRemoteDataSource.getCollectionWithId(tId))
              .thenAnswer((_) async => dioResponse);
          // act
          await repository.getCollectionWithId(tId);
          // assert
          verify(mockRemoteDataSource.getCollectionWithId(tId));
          clearInteractionsWithAll();
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.getCollectionWithId(tId))
              .thenAnswer((_) async => dioResponse);
          // act
          final result = await repository.getCollectionWithId(tId);
          // assert
          verify(mockRemoteDataSource.getCollectionWithId(tId));
          expect(result, equals(Right(tCollection)));

          clearInteractionsWithAll();
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.getCollectionWithId(any))
              .thenThrow(ServerException());
          // act
          final result = await repository.getCollectionWithId(tId);
          // assert
          verify(mockRemoteDataSource.getCollectionWithId(tId));
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
          final result = await repository.getCollectionWithId(tId);
          // assert
          verifyNoMoreInteractions(mockRemoteDataSource);
          verifyNoMoreInteractions(mockLocalDataStorage);
          expect(result, equals(Left(ServerFailure())));

          clearInteractionsWithAll();
        },
      );
    });
  });

  group('createCollection', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    final tCollection = Collection(
        id: 1,
        title: 'Saved For Later',
        entityId: 1,
        entity: const Entity(
            id: 1,
            name: 'hello',
            username: 'hello',
            description: null,
            hasUser: true,
            followersCount: 0,
            followedEntitiesCount: 1,
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
        addedBy: null,
        addedById: null,
        description: null,
        slug: 'saved-for-later',
        type: CollectionType.later,
        sort: null,
        createdAtStr: '2022-07-09 08:28:37',
        createdAt: DateTime.parse('2022-07-09 08:28:37.000Z'),
        createdAtAccuracy: CollectionCreatedAtAccuracy.hour,
        link: null,
        sourceContent: null,
        sourceContentId: null,
        visibility: null,
        verifiedAt: null,
        featuredAt: null,
        recommended: null,
        publishedAt: null,
        collectionTopics: null,
        insertedAt: DateTime.parse('2022-07-09 08:28:37.720780Z'));
    final Map<String, dynamic> dioResponse = {
      'added_by_id': null,
      'contents_count': 1,
      'created_at': '2022-07-09T08:28:37Z',
      'created_at_accuracy': 'hour',
      'created_at_str': '2022-07-09 08:28:37',
      'description': null,
      'entity': {
        'added_by_id': null,
        'description': null,
        'followed_contents_count': 0,
        'followed_entities_count': 1,
        'followed_topics_count': 0,
        'followers_count': 0,
        'following_entity': null,
        'has_user': true,
        'id': 1,
        'linkedin': null,
        'name': 'hello',
        'twitter': null,
        'username': 'hello',
        'website': null,
        'wikipedia': null
      },
      'entity_id': 1,
      'followers_count': 0,
      'id': 1,
      'inserted_at': '2022-07-09T08:28:37.720780Z',
      'link': null,
      'slug': 'saved-for-later',
      'title': 'Saved For Later',
      'type': 'later'
    };
    const tId = 1;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.createCollection(tCollection.toJson()))
          .thenAnswer((_) async => dioResponse);
      // act
      repository.createCollection(tCollection);
      // assert
      verify(mockNetworkInfo.isConnected);

      clearInteractionsWithAll();
    });

    runTestsOnline(() {
      test(
        'should make the call to remote data source successfully',
            () async {
          // arrange
          when(mockRemoteDataSource.createCollection(tCollection.toJson()))
              .thenAnswer((_) async => dioResponse);
          // act
          await repository.createCollection(tCollection);
          // assert
          verify(mockRemoteDataSource.createCollection(tCollection.toJson()));
          clearInteractionsWithAll();
        },
      );

      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          when(mockRemoteDataSource.createCollection(tCollection.toJson()))
              .thenAnswer((_) async => dioResponse);
          // act
          final result = await repository.createCollection(tCollection);
          // assert
          verify(mockRemoteDataSource.createCollection(tCollection.toJson()));
          expect(result, equals(Right(tCollection)));

          clearInteractionsWithAll();
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(mockRemoteDataSource.createCollection(tCollection.toJson()))
              .thenThrow(ServerException());
          // act
          final result = await repository.createCollection(tCollection);
          // assert
          verify(mockRemoteDataSource.createCollection(tCollection.toJson()));
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
          final result = await repository.createCollection(tCollection);
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