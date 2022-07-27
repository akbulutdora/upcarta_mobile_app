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

  RemoteDataSource dataSource = RemoteDataSource(dioClient: mockDio);
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
      'should preform a POST request to authenticate on the sessions endpoint and with application/json header',
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
  /*
  group('getAllContents', (){
    test('should perform a GET request on a URL',()async{
      //arrange
      when(mockDio.get<Map<String, dynamic>>('$baseURL/contents')).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture('content_list')),
            requestOptions: RequestOptions(path: '' )
          )
      );
      //act
      await dataSource.getAllContents();
      //assert
      verify(mockDio.get<Map<String, dynamic>>('$baseURL/contents'));
      clearInteractionsWithAll();

    });
  });
  */
  group('content',(){
    final Content tContent = Content(
      id: 450,
      title: 'Content1',
      description: 'We live in a society of adult-like children and childish adults. Kids have never had more information at their fingertips, so they’re growing up faster than ever. From a young age, they can watch violent war clips on YouTube, Dan Bilzerian videos on Instagram, and Shakira getting...',
      slug: 'adulting-fast-and-slow',
      type: ContentType.article,
      parent: null,
      children: null,
      addedBy: null,
      addedById: null,
      contentTopics: [],
      contributions: [const Contribution(id: null,
          role: ContributionRole.author,
          content: null,
          contentId: 1279,
          entity: Entity(id: null,
              name: 'David Perell',
              username: 'david_perell',
              description: "\"The Writing Guy\" | I tweet about writing, learning and business | My Podcast: https://t.co/1NhTBHcK8l | My writing school: https://t.co/bEFFy6bVaC",
              hasUser: false,
              followersCount: 2,
              followedEntitiesCount: 0,
              followedTopicsCount: 0,
              followedContentsCount: 0,
              addedBy: null,
              addedById: null,
              twitter: 'david_perell',
              website: null,
              linkedin: null,
              wikipedia: null,
              followingEntity: null,
              channelEntities: null),
          entityId: 19,
          pos: 1,
          addedBy: null,
          addedById: null)
      ],
      contentLinks: [
        const ContentLink(id: null,
            link: '''https://perell.com/essay/adulting-fast-and-slow/''',
            content: null,
            contentId: null,
            pos: null,
            body: null,
            hasEmbed: null,
            hasRatings: null,
            episodeNumber: null,
            duration: null,
            details: null)
      ],
      contentLinksCount: null,
      recommendersCount: null,
      followersCount: null,
      publicCollectionsCount: 0,
      featuredRecommendersCount: 0,
      contextRecommendersCount: 0,
      createdAt: DateTime.parse('2020-04-07 20:19:04.000Z'),
      createdAtAccuracy: CreatedAtAccuracy.hour,
      createdAtStr : null,
      followable: null,
      personalCurations: null,
      personalCollections:null,
      insertedAt: DateTime.parse('2021-03-30 20:06:25.678846Z'),
    );
    List<Map<String,dynamic>> tContentMapList = [tContent.toJson(),tContent.toJson()];
    final tContentJson = json.decode(fixture('content_with_id_response.json'));
    int tId = 450;
    group('getAllContentsEasy', () {

      test(
        'should perform a GET request on a URL',
            () async {
          // arrange
          when(mockDio.get<Map<String, dynamic>>('$baseURL/contents')).thenAnswer(
                (_) async => Response(
                statusCode: 200,
                data: json.decode(fixture('easy_content_list.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getAllContents();
          // assert
          verify(mockDio.get<Map<String, dynamic>>('$baseURL/contents'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should return ContentList when the response code is 200 (success)',
              ()async{
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/contents'))
                .thenAnswer(
                    (_)async => Response(
                    statusCode: 200,
                    data : json.decode(fixture('easy_content_list.json')),
                    requestOptions: RequestOptions(path:'')
                ));
            //act
            final result = await dataSource.getAllContents();
            //print(result);
            //assert
            expect(result, equals(tContentMapList));
            clearInteractionsWithAll();
          });
      test(
          'should return ServerError when the response code is 404',
              ()async{
            //arrange
            when(mockDio.get<Map<String,dynamic>>('$baseURL/contents'))
                .thenAnswer(
                    (_)async => Response(
                    statusCode: 404,
                    data: json.decode(fixture('no_resource.json')),
                    requestOptions: RequestOptions(path : '')
                ));
            //act
            print('2');
            final call = dataSource.getAllContents();
            print('1');
            //assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
            clearInteractionsWithAll();
          }
      );

    });
    group('getContentWithId',() {
      test(
        'should preform a GET request on a URL with number being the endpoint and with application/json header',
          ()async{
          //arrange
          when(mockDio.get<Map<String,dynamic>>('$baseURL/contents/$tId')).thenAnswer(
              (_) async => Response(
                statusCode: 200,
                data: json.decode(fixture('content_with_id_response.json')),
                requestOptions: RequestOptions(path: '')
              )
          );
          //act
            await dataSource.getContentWithId(tId);
          //assert
            verify(mockDio.get<Map<String,dynamic>>('$baseURL/contents/$tId'));
            clearInteractionsWithAll();
          }
      );
      test('should return Content when the response code is 200 (success)',
          ()async{
          //arrange
            when(mockDio.get<Map<String,dynamic>>('$baseURL/contents/$tId')).thenAnswer(
                    (_) async => Response(
                    statusCode: 200,
                    data: json.decode(fixture('content_with_id_response.json')),
                    requestOptions: RequestOptions(path: ''),
                )
            );
          //act
            final result = await dataSource.getContentWithId(tId);
          //assert
            expect(Content.fromJson(result!),equals(tContent));
            clearInteractionsWithAll();
        }
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/contents/$tId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: json.decode(fixture('no_resource.json')),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.getContentWithId(tId);
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
    });
    group('createContent',(){
      test('should preform a POST request on a URL with number being the endpoint and with application/json header',
          ()async{
          //arrange

          }
      );
    });
  });

  group('getEntityById', () {
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
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
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
      'should preform a POST request on a URL with application/json header',
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
        (_) async =>
            Response(statusCode: 401, requestOptions: RequestOptions(path: '')),
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
      'should preform a DELETE request on a URL with application/json header',
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
        (_) async =>
            Response(statusCode: 401, requestOptions: RequestOptions(path: '')),
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
      'should preform a GET request on a URL',
      () async {
        // arrange
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
            data: json.decode(fixture('follower_entity_success_response.json')),
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
      ))
          .thenAnswer(
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
      'should preform a GET request on a URL',
          () async {
        // arrange
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
                data: json.decode(fixture('follower_entity_success_response.json')),
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
          ))
              .thenAnswer(
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
}
