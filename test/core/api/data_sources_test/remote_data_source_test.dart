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
            final call = dataSource.getAllContents();
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
      final Map<String, dynamic> cContent = {
        'data': tContent.toJson(),
      };
      test(
        'should perform a POST request on a URL with application/json header',
            () async {
          //arrange
          when(mockDio.post('$baseURL/contents', data: {'content':cContent}))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: cContent,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.createContent(cContent);
          // assert
          verify(mockDio.post('$baseURL/contents', data: {'content':cContent}));
          clearInteractionsWithAll();
        },
      );
      test(
        'should create the content and return Collection when the response code is 201 (success)',
            () async {
          //arrange
          when(mockDio.post('$baseURL/contents', data: {'content':cContent}))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: cContent,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          final result = await dataSource.createContent(cContent);
          // assert
          expect(result, cContent['data']);

          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is not 201',
              () async {
            //arrange
            when(mockDio.post('$baseURL/contents', data: {'content':cContent}))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: fixture('no_resource.json'),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.createContent(cContent);
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });

    });
    group('deleteContent',(){
      test(
        'should perform a DELETE request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 204,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.deleteContent(tId);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
            () async {
              //arrange
              when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId'))
                  .thenAnswer(
                    (_) async => Response(
                    statusCode: 404,
                    data: null,
                    requestOptions: RequestOptions(path: '')),
              );
              // act
              final call = dataSource.deleteContent(tId);
              // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('saveContent',(){
      test(
        'should perform a POST request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/saves'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: json.decode(fixture('content_saveContent_success_response')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.saveContent(tId);
          // assert
          verify(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/saves'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/saves'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.saveContent(tId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('deleteContentSave',(){
      test(
        'should perform a DELETE request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/saves'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 204,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.deleteContentSave(tId);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/saves'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/saves'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.deleteContentSave(tId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('markContentAsFinished',(){
      test(
        'should perform a POST request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: json.decode(fixture('content_markContentAsFinished_success_response.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.markContentAsFinished(tId);
          // assert
          verify(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.markContentAsFinished(tId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('unmarkContentAsFinished',(){
      test(
        'should perform a DELETE request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 204,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.unmarkContentAsFinished(tId);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/finishes'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.unmarkContentAsFinished(tId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('addContentToCollection',(){
      int tCollectionId = 1;
      test(
        'should perform a POST request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 201,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.addContentToCollection(tId,tCollectionId);
          // assert
          verify(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.post<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.addContentToCollection(tId,tCollectionId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
    group('deleteCollectionContent',(){
      int tCollectionId = 1;
      test(
        'should perform a DELETE request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 204,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.deleteCollectionContent(tId,tCollectionId);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.delete<Map<String, dynamic>>('$baseURL/contents/$tId/collection/$tCollectionId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.deleteCollectionContent(tId,tCollectionId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });

  });

  group('entity', () {
    group('getAllEntities',(){
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
      List<Map<String,dynamic>> tEntityList= [tEntity.toJson(),tEntity.toJson()];

      test(
        'should perform a GET request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.get<Map<String, dynamic>>('$baseURL/entities'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 200,
                data: json.decode(fixture('show_entity_list_success_response.json')),
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.getAllEntities();
          // assert
          verify(mockDio.get<Map<String, dynamic>>('$baseURL/entities'));
          clearInteractionsWithAll();
        },
      );

      test('should return Entity List when the response code is 200 (success)',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/entities'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 200,
                  data: json.decode(fixture('show_entity_list_success_response.json')),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final result = await dataSource.getAllEntities();
            // assert
            expect(result, equals(tEntityList));
            clearInteractionsWithAll();
          });

      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.get<Map<String, dynamic>>('$baseURL/entities'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: json.decode(fixture('no_resource.json')),
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.getAllEntities();
            // assert
            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });

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

    group('deleteCollectionWithId',(){
      int tId = 1;
      test(
        'should perform a DELETE request on a URL with number being the endpoint and with application/json header',
            () async {
          //arrange
          when(mockDio.delete<Map<String, dynamic>>('$baseURL/collections/$tId'))
              .thenAnswer(
                (_) async => Response(
                statusCode: 204,
                data: null,
                requestOptions: RequestOptions(path: '')),
          );
          // act
          await dataSource.deleteCollectionWithId(tId);
          // assert
          verify(mockDio.delete<Map<String, dynamic>>('$baseURL/collections/$tId'));
          clearInteractionsWithAll();
        },
      );
      test(
          'should throw a ServerException when the response code is 404 or other',
              () async {
            //arrange
            when(mockDio.delete<Map<String, dynamic>>('$baseURL/collections/$tId'))
                .thenAnswer(
                  (_) async => Response(
                  statusCode: 404,
                  data: null,
                  requestOptions: RequestOptions(path: '')),
            );
            // act
            final call = dataSource.deleteCollectionWithId(tId);
            // assert

            expect(() => call, throwsA(const TypeMatcher<ServerException>()));
          });
      clearInteractionsWithAll();
    });
  });

}
