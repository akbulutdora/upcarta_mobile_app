import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../shared_mocks.mocks.dart';

void main() {
  /// The mock Dio Client.
  MockDio mockDio = MockDio();
  when(mockDio.interceptors).thenAnswer((_) => Interceptors());

  RemoteDataSource dataSource = RemoteDataSource(dioClient: mockDio);
  const String baseURL = 'https://upcarta-staging.onrender.com/api/v1';

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
    test('should call getEntityWithID', () async {
      final resp = await dataSource2.getEntityWithId(2);
      Entity.fromJson(resp!);
    });
    test('should call getAllContents', () async {
      final l = await dataSource2.getAllContents();
      // print(List<Content>.from(l!.map((model)=> Content.fromJson(model))));
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
    test('should call getAllCollections', () async {
      final l = await dataSource2.getAllCollections();
      print(
          List<Collection>.from(l!.map((model) => Collection.fromJson(model))));
      print(l);
    });
    test('should call getCollectionWithId', () async {
      final collectionResp = await dataSource2.getCollectionWithId(1);
      print(collectionResp);
      print(Collection.fromJson(collectionResp!));
    });
    test('should call createCollection', () async {
      const Collection tCollection = Collection(
        title: 'Test Collection11',
        description: null,
        type: CollectionType.personal,
        recommended: false,
      );
      final collectionResp = await dataSource2.createCollection(tCollection.toJson());
      print(collectionResp);
      print(Collection.fromJson(collectionResp!));
    });

    clearInteractionsWithAll();
  });

  group('authenticate', () {
    const tEmail = 'hello@upcarta.com';
    const tPassword = '12345678';
    Map<String, dynamic> decoded = json.decode(fixture('token_cached.json'));
    final tToken = decoded['jwt'];

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
      'should perform a POST request to authenticate on the sessions endpoint and with application/json header',
      () {
        //arrange
        when(mockDio.post<Map<String, dynamic>>(
          '$baseURL/sessions',
          data: {
            'session': {'email': tEmail, 'password': tPassword}
          },
        )).thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('session_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        dataSource.login(email: tEmail, password: tPassword);
        // assert
        verify(mockDio.post<Map<String, dynamic>>(
          '$baseURL/sessions',
          data: {
            'session': {'email': tEmail, 'password': tPassword}
          },
        ));
        clearInteractionsWithAll();
      },
    );

    test(
      'should return the user token when the response code is 200 (success)',
      () async {
        // arrange
        when(mockDio.post<Map<String, dynamic>>(
          '$baseURL/sessions',
          data: {
            'session': {'email': tEmail, 'password': tPassword}
          },
        )).thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('session_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final result =
            await dataSource.login(email: tEmail, password: tPassword);
        // assert
        expect(result![0], equals(tToken));
        expect(User.fromJson(result[1]), equals(tUser));
        clearInteractionsWithAll();
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockDio.post<Map<String, dynamic>>(
          '$baseURL/sessions',
          data: {
            'session': {'email': tEmail, 'password': tPassword}
          },
        )).thenAnswer(
          (_) async => Response(
              statusCode: 404,
              data: json.decode(fixture('no_resource.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(email: tEmail, password: tPassword),
            throwsA(const TypeMatcher<ServerException>()));
        clearInteractionsWithAll();
      },
    );
  });

  group('getAllContents', () {
    test(
      'should perform a GET request on a URL',
      () async {
        // arrange
        when(mockDio.get<Map<String, dynamic>>('$baseURL/contents')).thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('content_list.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        await dataSource.getAllContents();
        // assert
        verify(mockDio.get<Map<String, dynamic>>('$baseURL/contents'));
        clearInteractionsWithAll();
      },
    );
  });

  group('entity', () {
    group('getEntityWithId', () {
      Map<String, dynamic> decoded = json.decode(fixture('token_cached.json'));
      const tId = 233;
      const tEntity = Entity(
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

      test(
        'should perform a GET request on a URL with number being the endpoint and with application/json header',
        () async {
          //arrange
          when(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'))
              .thenAnswer(
            (_) async => Response(
                statusCode: 200,
                data: json.decode(fixture('show_entity_success_response.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getEntityWithId(tId);
          // assert
          verify(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'));
          clearInteractionsWithAll();
        },
      );

      test('should return Entity when the response code is 200 (success)',
          () async {
        //arrange
        when(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'))
            .thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('show_entity_success_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final result = await dataSource.getEntityWithId(tId);
        // assert
        expect(Entity.fromJson(result!), equals(tEntity));
        clearInteractionsWithAll();
      });

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        //arrange
        when(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'))
            .thenAnswer(
          (_) async => Response(
              statusCode: 404,
              data: json.decode(fixture('no_resource.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.getEntityWithId(tId);
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      });
      clearInteractionsWithAll();
    });

    group('followEntityWithId', () {
      const tId = 2;
      test(
        'should perform a POST request on a URL with application/json header',
        () async {
          // arrange
          when(mockDio.post<Map<String, dynamic>>(
            '$baseURL/entities/$tId/follows',
          )).thenAnswer(
            (_) async => Response(
                statusCode: 201, requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.followEntityWithId(2);
          // assert
          verify(mockDio.post<Map<String, dynamic>>(
            '$baseURL/entities/$tId/follows',
          ));
          clearInteractionsWithAll();
        },
      );

      test('should throw a [ServerException] when the response code is not 204',
          () async {
        // arrange
        when(mockDio.post<Map<String, dynamic>>(
          '$baseURL/entities/$tId/follows',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 401, requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.followEntityWithId;
        // assert
        expect(() => call(2), throwsA(const TypeMatcher<ServerException>()));
        clearInteractionsWithAll();
      });
    });

    group('unfollowEntityWithId', () {
      const tId = 2;
      test(
        'should perform a DELETE request on a URL with application/json header',
        () async {
          // arrange
          when(mockDio.delete<Map<String, dynamic>>(
            '$baseURL/entities/$tId/follows',
          )).thenAnswer(
            (_) async => Response(
                statusCode: 204, requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.unfollowEntityWithId(2);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>(
            '$baseURL/entities/$tId/follows',
          ));
          clearInteractionsWithAll();
        },
      );

      test('should throw a [ServerException] when the response code is not 204',
          () {
        // arrange
        when(mockDio.delete<Map<String, dynamic>>(
          '$baseURL/entities/$tId/follows',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 401, requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.unfollowEntityWithId;
        // assert
        expect(() => call(2), throwsA(const TypeMatcher<ServerException>()));
        clearInteractionsWithAll();
      });
    });

    group('getEntityFollowers', () {
      final tResponse =
          json.decode(fixture('follower_entity_success_response.json'));
      final tEntities = List<Entity>.from(json
          .decode(fixture('follower_entity_success_response.json'))!['data']
          .map((model) => Entity.fromJson(model)));
      const tId = 2;

      test(
        'should perform a GET request on a URL',
        () async {
          // arrange
          when(mockDio.get(
            '$baseURL/entities/$tId/followers',
          )).thenAnswer(
            (_) async => Response(
                statusCode: 200,
                data: json
                    .decode(fixture('follower_entity_success_response.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getEntityFollowers(tId);
          // assert
          verify(mockDio.get(
            '$baseURL/entities/$tId/followers',
          ));
          clearInteractionsWithAll();
        },
      );

      test(
          'should return the response data when the response code is 200 (success)',
          () async {
        //arrange
        when(mockDio.get(
          '$baseURL/entities/$tId/followers',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data:
                  json.decode(fixture('follower_entity_success_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final result = await dataSource.getEntityFollowers(tId);
        final resultEntities =
            List<Entity>.from(result!.map((model) => Entity.fromJson(model)));

        // assert
        expect(resultEntities, equals(tEntities));
        clearInteractionsWithAll();
      });

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        //arrange
        when(mockDio.get(
          '$baseURL/entities/$tId/followers',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 404,
              data: json.decode(fixture('no_resource.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.getEntityFollowers(tId);
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
        clearInteractionsWithAll();
      });
    });

    group('getEntityFollowing', () {
      final tResponse =
          json.decode(fixture('follower_entity_success_response.json'));
      final tEntities = List<Entity>.from(json
          .decode(fixture('follower_entity_success_response.json'))!['data']
          .map((model) => Entity.fromJson(model)));
      const tId = 2;

      test(
        'should perform a GET request on a URL',
        () async {
          // arrange
          when(mockDio.get(
            '$baseURL/entities/$tId/following',
          )).thenAnswer(
            (_) async => Response(
                statusCode: 200,
                data: json
                    .decode(fixture('follower_entity_success_response.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getEntityFollowing(tId);
          // assert
          verify(mockDio.get(
            '$baseURL/entities/$tId/following',
          ));
          clearInteractionsWithAll();
        },
      );

      test(
          'should return the response data when the response code is 200 (success)',
          () async {
        //arrange
        when(mockDio.get(
          '$baseURL/entities/$tId/following',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data:
                  json.decode(fixture('follower_entity_success_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final result = await dataSource.getEntityFollowing(tId);
        final resultEntities =
            List<Entity>.from(result!.map((model) => Entity.fromJson(model)));

        // assert
        expect(resultEntities, equals(tEntities));
        clearInteractionsWithAll();
      });

      test(
          'should throw a ServerException when the response code is 404 or other',
          () async {
        //arrange
        when(mockDio.get(
          '$baseURL/entities/$tId/following',
        )).thenAnswer(
          (_) async => Response(
              statusCode: 404,
              data: json.decode(fixture('no_resource.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        final call = dataSource.getEntityFollowing(tId);
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
        clearInteractionsWithAll();
      });
    });
  });

  group('collection', () {
    group('getCollectionWithId', () {
      final response = json.decode(fixture('collection_success_response.json'));
      const tId = 1;

      test(
        'should perform a GET request on a URL with application/json header',
            () async {
          //arrange
          when(mockDio.get<Map<String, dynamic>>('$baseURL/collections/$tId'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 200,
                data: response,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getCollectionWithId(tId);
          // assert
          verify(mockDio.get<Map<String, dynamic>>('$baseURL/collections/$tId'));
          clearInteractionsWithAll();
        },
      );

      test('should return Collection when the response code is 200 (success)',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/collections/$tId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 200,
                  data: response,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final result = await dataSource.getCollectionWithId(tId);
            // assert
            expect(result, response['data']);
            clearInteractionsWithAll();
          });

      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/collections/$tId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: json.decode(fixture('no_resource.json')),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.getCollectionWithId(tId);
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });

    group('getAllCollections', () {
      final response = json.decode(fixture('collection_list_success_response.json'));
      test(
        'should perform a GET request on a URL with application/json header',
            () async {
          //arrange
          when(mockDio.get<Map<String, dynamic>>('$baseURL/collections'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 200,
                data: response,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getAllCollections();
          // assert
          verify(mockDio.get<Map<String, dynamic>>('$baseURL/collections'));
          clearInteractionsWithAll();
        },
      );

      test('should return Collection list when the response code is 200 (success)',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/collections'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 200,
                  data: response,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final result = await dataSource.getAllCollections();
            // assert
            expect(result, response['data']);
            clearInteractionsWithAll();
          });

      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/collections'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: json.decode(fixture('no_resource.json')),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.getAllCollections();
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
    });
    
    group('createCollection', () {
      const Map<String, dynamic> collection = {
        'data': {
          'added_by_id': null,
          'contents_count': 3,
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
        }
      };
      test(
        'should perform a POST request on a URL with application/json header',
            () async {
          //arrange
          when(mockDio.post('$baseURL/collections', data: {'collection':collection}))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: collection,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.createCollection(collection);
          // assert
          verify(mockDio.post('$baseURL/collections', data: {'collection':collection}));
          clearInteractionsWithAll();
        },
      );
      test(
        'should create the collection and return Collection when the response code is 201 (success)',
            () async {
          //arrange
          when(mockDio.post('$baseURL/collections', data: {'collection':collection}))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: collection,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          final result = await dataSource.createCollection(collection);
          // assert
          expect(result, collection['data']);

          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is not 201',
              () async {
            //arrange
                when(mockDio.post('$baseURL/collections', data: {'collection':collection}))
                    .thenAnswer(
                      (_) async => Response(
                      statusCode: 404,
                      data: fixture('no_resource.json'),
                      requestOptions: RequestOptions(path: '')),
                );
            // act
            final call = dataSource.createCollection(collection);
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
    });
  });
}
