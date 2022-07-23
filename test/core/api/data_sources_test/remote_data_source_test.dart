import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../shared_mocks.mocks.dart';

void main() {
  // The mock Http Client.

  MockDio mockDio = MockDio();
  when(mockDio.interceptors).thenAnswer((_) => Interceptors());

  RemoteDataSource dataSource = RemoteDataSource(dioClient: mockDio);
  String baseURL = 'https://upcarta-staging.onrender.com/api/v1';

  // FIXME: Error in next line
  // print(Content.fromJson(json.decode(fixture('content.json'))));

  group('reqs with dio', () {
    RemoteDataSource dataSource2 = RemoteDataSource(dioClient: Dio());

    const tEmail = 'hello@upcarta.com';
    const tPassword = '12345678';

    test('should call login', () async {
      await dataSource2.login(email: tEmail, password: tPassword);
    });

    test('should call getEntityByID', () async {
      await dataSource2.getEntityById(2);
    });

    test('should call getAllContents', () async {
      await dataSource2.getAllContents();
    });

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
      },
    );
  });

  group('getAllContents', () {
    // TODO: TEST GET LIST OF CONTENTS, STATUSCODE = 200
    final List<Content> tEmptyContents = [];

    test(
      'should preform a GET request on a URL with application/json header',
      () {
        // arrange
        when(mockDio.get<Map<String, dynamic>>('$baseURL/contents/'))
            .thenAnswer(
              (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('content_list.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        dataSource.getAllContents();
        // assert
        verify(mockDio.get<Map<String, dynamic>>('$baseURL/contents'));
      },
    );

    test(
      'should return empty list of contents when the response code is 401 (unauthorized)',
          () async {
        // // arrange
        // when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        //   (_) async => http.Response(fixture('no_resource.json'), 401),
        // );
        // // act
        // final result = await dataSource.getAllContents();
        // // assert
        // expect(result, equals(tEmptyContents));
      },
    );
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
      () {
        //arrange
        when(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'))
            .thenAnswer(
          (_) async => Response(
              statusCode: 200,
              data: json.decode(fixture('show_entity_success_response.json')),
              requestOptions: RequestOptions(path: '')),
        );
        // act
        dataSource.getEntityById(tId);
        // assert
        verify(mockDio.get<Map<String, dynamic>>('$baseURL/entities/$tId'));
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
      final result = await dataSource.getEntityById(tId);
      // assert
      expect(Entity.fromJson(result!), equals(tEntity));
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
      final call = dataSource.getEntityById(tId);
      // assert
      expect(() => call, throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
