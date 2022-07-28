import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../shared_mocks.mocks.dart';


void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  LocalDataStorageImpl dataSource = LocalDataStorageImpl(
    sharedPreferences: mockSharedPreferences,
  );

  group('getUserToken', () {
    Map<String, dynamic> decoded = json.decode(fixture('token_cached.json'));
    final tToken = decoded['jwt'];

    test(
      'should return the user token from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('token_cached.json'));
        // act
        final result = await dataSource.getUserToken();
        // assert
        verify(mockSharedPreferences.getString(CACHED_USER_TOKEN));
        expect(result, equals(tToken));
      },
    );

    test(
      'should throw a CacheException when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.getUserToken;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });
}
