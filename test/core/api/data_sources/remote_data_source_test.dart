import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../shared_mocks.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  // The mock Http Client.
  MockClient mockHttpClient = MockClient();
  RemoteDataSourceImpl dataSource =
      RemoteDataSourceImpl(client: mockHttpClient);

  group('authenticate', () {
    const tEmail = 'hello@upcarta.com';
    const tPassword = '12345678';
    Map<String, dynamic> decoded = json.decode(fixture('token_cached.json'));
    final tToken = decoded['jwt'];

    test(
      'should preform a POST request to authenticate on the sessions endpoint and with application/json header',
      () {
        //arrange
        when(mockHttpClient.post(any,
                headers: anyNamed('headers'), body: anyNamed('body')))
            .thenAnswer(
          (_) async => http.Response(fixture('token_cached.json'), 200),
        );
        // act
        dataSource.authenticate(email: tEmail, password: tPassword);
        // assert
        verify(mockHttpClient.post(
          Uri.parse('https://upcarta-staging.onrender.com/api/v1/sessions'),
          headers: {'Content-Type': 'application/json'},
          body: {
            'session': {'email': 'hello@upcarta.com', 'password': '12345678'}
          },
        ));
      },
    );

    test(
      'should return the user token when the response code is 200 (success)',
          () async {
        // arrange
        when(mockHttpClient.post(any, body: anyNamed('body'),headers: anyNamed('headers'),)).thenAnswer(
              (_) async => http.Response(fixture('token_cached.json'), 200),
        );
        // act
        final result = await dataSource.authenticate(email: tEmail, password: tPassword);
        // assert
        expect(result, equals(tToken));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        when(mockHttpClient.post(any, headers: anyNamed('headers'), body: anyNamed('body'))).thenAnswer(
              (_) async => http.Response('Something went wrong', 404),
        );
        // act
        final call = dataSource.authenticate;
        // assert
        expect(() => call(email: tEmail, password: tPassword), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}