// Mocks generated by Mockito 5.2.0 from annotations
// in upcarta_mobile_app/test/shared_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart'
    as _i4;
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart'
    as _i3;
import 'package:upcarta_mobile_app/core/error/failures.dart' as _i11;
import 'package:upcarta_mobile_app/core/platform/network_info.dart' as _i5;
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart' as _i12;
import 'package:upcarta_mobile_app/models/entity/entity.dart' as _i14;
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart' as _i2;
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart'
    as _i15;
import 'package:upcarta_mobile_app/repositories/entity_repository/entity_repository.dart'
    as _i13;
import 'package:upcarta_mobile_app/repositories/feed_repository.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUser_0 extends _i1.Fake implements _i2.User {}

class _FakeRemoteDataSource_1 extends _i1.Fake implements _i3.RemoteDataSource {
}

class _FakeLocalDataStorage_2 extends _i1.Fake implements _i4.LocalDataStorage {
}

class _FakeNetworkInfo_3 extends _i1.Fake implements _i5.NetworkInfo {}

class _FakeEither_4<L, R> extends _i1.Fake implements _i6.Either<L, R> {}

class _FakeBaseOptions_5 extends _i1.Fake implements _i7.BaseOptions {}

class _FakeHttpClientAdapter_6 extends _i1.Fake
    implements _i7.HttpClientAdapter {}

class _FakeTransformer_7 extends _i1.Fake implements _i7.Transformer {}

class _FakeInterceptors_8 extends _i1.Fake implements _i7.Interceptors {}

class _FakeResponse_9<T> extends _i1.Fake implements _i7.Response<T> {}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i3.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get bearerToken =>
      (super.noSuchMethod(Invocation.getter(#bearerToken), returnValue: '')
          as String);
  @override
  set bearerToken(String? _bearerToken) =>
      super.noSuchMethod(Invocation.setter(#bearerToken, _bearerToken),
          returnValueForMissingStub: null);
  @override
  String get baseURL =>
      (super.noSuchMethod(Invocation.getter(#baseURL), returnValue: '')
          as String);
  @override
  set baseURL(String? _baseURL) =>
      super.noSuchMethod(Invocation.setter(#baseURL, _baseURL),
          returnValueForMissingStub: null);
  @override
  _i8.Future<List<dynamic>?> login({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(#login, [], {#email: email, #password: password}),
          returnValue:
              Future<List<dynamic>?>.value()) as _i8.Future<List<dynamic>?>);
  @override
  _i8.Future<_i2.User> authenticate({String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #authenticate, [], {#email: email, #password: password}),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i8.Future<_i2.User>);
  @override
  _i8.Future<String> register({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(
              #register, [], {#email: email, #password: password}),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<List<dynamic>?> getAllContents() =>
      (super.noSuchMethod(Invocation.method(#getAllContents, []),
              returnValue: Future<List<dynamic>?>.value())
          as _i8.Future<List<dynamic>?>);
  @override
  _i8.Future<Map<String, dynamic>?> getEntityWithId(int? id) =>
      (super.noSuchMethod(Invocation.method(#getEntityWithId, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i8.Future<Map<String, dynamic>?>);
  @override
  dynamic followEntityWithId(int? id) =>
      super.noSuchMethod(Invocation.method(#followEntityWithId, [id]));
  @override
  dynamic unfollowEntityWithId(int? id) =>
      super.noSuchMethod(Invocation.method(#unfollowEntityWithId, [id]));
  @override
  _i8.Future<List<dynamic>?> getAllEntities() =>
      (super.noSuchMethod(Invocation.method(#getAllEntities, []),
              returnValue: Future<List<dynamic>?>.value())
          as _i8.Future<List<dynamic>?>);
  @override
  _i8.Future<List<dynamic>?> getEntityFollowers(int? id) =>
      (super.noSuchMethod(Invocation.method(#getEntityFollowers, [id]),
              returnValue: Future<List<dynamic>?>.value())
          as _i8.Future<List<dynamic>?>);
}

/// A class which mocks [LocalDataStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataStorage extends _i1.Mock implements _i4.LocalDataStorage {
  MockLocalDataStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> getUserToken() =>
      (super.noSuchMethod(Invocation.method(#getUserToken, []),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i2.User> getUser() =>
      (super.noSuchMethod(Invocation.method(#getUser, []),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i8.Future<_i2.User>);
  @override
  _i8.Future<void> cacheUserToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#cacheUserToken, [token]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> cacheUser(_i2.User? user) =>
      (super.noSuchMethod(Invocation.method(#cacheUser, [user]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i9.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(Invocation.method(#getKeys, []),
      returnValue: <String>{}) as Set<String>);
  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);
  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);
  @override
  _i8.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key, value]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> commit() =>
      (super.noSuchMethod(Invocation.method(#commit, []),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
}

/// A class which mocks [FeedRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeedRepository extends _i1.Mock implements _i10.FeedRepository {
  MockFeedRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(Invocation.getter(#remoteDataSource),
          returnValue: _FakeRemoteDataSource_1()) as _i3.RemoteDataSource);
  @override
  _i4.LocalDataStorage get localDataStorage =>
      (super.noSuchMethod(Invocation.getter(#localDataStorage),
          returnValue: _FakeLocalDataStorage_2()) as _i4.LocalDataStorage);
  @override
  _i5.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_3()) as _i5.NetworkInfo);
  @override
  String get userId =>
      (super.noSuchMethod(Invocation.getter(#userId), returnValue: '')
          as String);
  @override
  set userId(String? _userId) =>
      super.noSuchMethod(Invocation.setter(#userId, _userId),
          returnValueForMissingStub: null);
  @override
  _i8.Future<_i6.Either<_i11.Failure, _i6.IList<_i12.Content>>>
      getAllContents() => (super.noSuchMethod(
              Invocation.method(#getAllContents, []),
              returnValue: Future<
                      _i6.Either<_i11.Failure, _i6.IList<_i12.Content>>>.value(
                  _FakeEither_4<_i11.Failure, _i6.IList<_i12.Content>>()))
          as _i8.Future<_i6.Either<_i11.Failure, _i6.IList<_i12.Content>>>);
}

/// A class which mocks [EntityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockEntityRepository extends _i1.Mock implements _i13.EntityRepository {
  MockEntityRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(Invocation.getter(#remoteDataSource),
          returnValue: _FakeRemoteDataSource_1()) as _i3.RemoteDataSource);
  @override
  _i4.LocalDataStorage get localDataStorage =>
      (super.noSuchMethod(Invocation.getter(#localDataStorage),
          returnValue: _FakeLocalDataStorage_2()) as _i4.LocalDataStorage);
  @override
  _i5.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_3()) as _i5.NetworkInfo);
  @override
  _i8.Future<_i6.Either<_i11.Failure, _i14.Entity>> getEntityWithId(int? id) =>
      (super.noSuchMethod(Invocation.method(#getEntityWithId, [id]),
              returnValue: Future<_i6.Either<_i11.Failure, _i14.Entity>>.value(
                  _FakeEither_4<_i11.Failure, _i14.Entity>()))
          as _i8.Future<_i6.Either<_i11.Failure, _i14.Entity>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, void>> followEntityWithId(int? id) =>
      (super.noSuchMethod(Invocation.method(#followEntityWithId, [id]),
              returnValue: Future<_i6.Either<_i11.Failure, void>>.value(
                  _FakeEither_4<_i11.Failure, void>()))
          as _i8.Future<_i6.Either<_i11.Failure, void>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, void>> unfollowEntityWithId(int? id) =>
      (super.noSuchMethod(Invocation.method(#unfollowEntityWithId, [id]),
              returnValue: Future<_i6.Either<_i11.Failure, void>>.value(
                  _FakeEither_4<_i11.Failure, void>()))
          as _i8.Future<_i6.Either<_i11.Failure, void>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>> getAllEntities() =>
      (super.noSuchMethod(Invocation.method(#getAllEntities, []),
              returnValue:
                  Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>.value(
                      _FakeEither_4<_i11.Failure, List<_i14.Entity>>()))
          as _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>> getEntityFollowers(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getEntityFollowers, [id]),
              returnValue:
                  Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>.value(
                      _FakeEither_4<_i11.Failure, List<_i14.Entity>>()))
          as _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>> getEntityFollowing(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getEntityFollowings, [id]),
              returnValue:
                  Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>.value(
                      _FakeEither_4<_i11.Failure, List<_i14.Entity>>()))
          as _i8.Future<_i6.Either<_i11.Failure, List<_i14.Entity>>>);
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i15.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(Invocation.getter(#remoteDataSource),
          returnValue: _FakeRemoteDataSource_1()) as _i3.RemoteDataSource);
  @override
  _i4.LocalDataStorage get localDataStorage =>
      (super.noSuchMethod(Invocation.getter(#localDataStorage),
          returnValue: _FakeLocalDataStorage_2()) as _i4.LocalDataStorage);
  @override
  _i5.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_3()) as _i5.NetworkInfo);
  @override
  String get appUserToken =>
      (super.noSuchMethod(Invocation.getter(#appUserToken), returnValue: '')
          as String);
  @override
  _i2.User get appUser => (super.noSuchMethod(Invocation.getter(#appUser),
      returnValue: _FakeUser_0()) as _i2.User);
  @override
  _i8.Future<_i6.Either<_i11.Failure, _i2.User>> authenticate(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#authenticate, [email, password]),
              returnValue: Future<_i6.Either<_i11.Failure, _i2.User>>.value(
                  _FakeEither_4<_i11.Failure, _i2.User>()))
          as _i8.Future<_i6.Either<_i11.Failure, _i2.User>>);
  @override
  _i8.Future<_i6.Either<_i11.Failure, String>> register(
          String? username, String? password) =>
      (super.noSuchMethod(Invocation.method(#register, [username, password]),
              returnValue: Future<_i6.Either<_i11.Failure, String>>.value(
                  _FakeEither_4<_i11.Failure, String>()))
          as _i8.Future<_i6.Either<_i11.Failure, String>>);
  @override
  _i8.Future<void> logOut() =>
      (super.noSuchMethod(Invocation.method(#logOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i7.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.BaseOptions get options =>
      (super.noSuchMethod(Invocation.getter(#options),
          returnValue: _FakeBaseOptions_5()) as _i7.BaseOptions);
  @override
  set options(_i7.BaseOptions? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i7.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(Invocation.getter(#httpClientAdapter),
          returnValue: _FakeHttpClientAdapter_6()) as _i7.HttpClientAdapter);
  @override
  set httpClientAdapter(_i7.HttpClientAdapter? _httpClientAdapter) => super
      .noSuchMethod(Invocation.setter(#httpClientAdapter, _httpClientAdapter),
          returnValueForMissingStub: null);
  @override
  _i7.Transformer get transformer =>
      (super.noSuchMethod(Invocation.getter(#transformer),
          returnValue: _FakeTransformer_7()) as _i7.Transformer);
  @override
  set transformer(_i7.Transformer? _transformer) =>
      super.noSuchMethod(Invocation.setter(#transformer, _transformer),
          returnValueForMissingStub: null);
  @override
  _i7.Interceptors get interceptors =>
      (super.noSuchMethod(Invocation.getter(#interceptors),
          returnValue: _FakeInterceptors_8()) as _i7.Interceptors);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
  @override
  _i8.Future<_i7.Response<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                path
              ], {
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> getUri<T>(Uri? uri,
          {_i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#getUri, [
                uri
              ], {
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> postUri<T>(Uri? uri,
          {dynamic data,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#postUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> putUri<T>(Uri? uri,
          {dynamic data,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#putUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> head<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#head, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> headUri<T>(Uri? uri,
          {dynamic data, _i7.Options? options, _i7.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#headUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> deleteUri<T>(Uri? uri,
          {dynamic data, _i7.Options? options, _i7.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> patchUri<T>(Uri? uri,
          {dynamic data,
          _i7.Options? options,
          _i7.CancelToken? cancelToken,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patchUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  void lock() => super.noSuchMethod(Invocation.method(#lock, []),
      returnValueForMissingStub: null);
  @override
  void unlock() => super.noSuchMethod(Invocation.method(#unlock, []),
      returnValueForMissingStub: null);
  @override
  void clear() => super.noSuchMethod(Invocation.method(#clear, []),
      returnValueForMissingStub: null);
  @override
  _i8.Future<_i7.Response<dynamic>> download(String? urlPath, dynamic savePath,
          {_i7.ProgressCallback? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          _i7.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i7.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#download, [
                urlPath,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i7.Response<dynamic>>.value(
                  _FakeResponse_9<dynamic>()))
          as _i8.Future<_i7.Response<dynamic>>);
  @override
  _i8.Future<_i7.Response<dynamic>> downloadUri(Uri? uri, dynamic savePath,
          {_i7.ProgressCallback? onReceiveProgress,
          _i7.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i7.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#downloadUri, [
                uri,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i7.Response<dynamic>>.value(
                  _FakeResponse_9<dynamic>()))
          as _i8.Future<_i7.Response<dynamic>>);
  @override
  _i8.Future<_i7.Response<T>> request<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i7.CancelToken? cancelToken,
          _i7.Options? options,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> requestUri<T>(Uri? uri,
          {dynamic data,
          _i7.CancelToken? cancelToken,
          _i7.Options? options,
          _i7.ProgressCallback? onSendProgress,
          _i7.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#requestUri, [
                uri
              ], {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
  @override
  _i8.Future<_i7.Response<T>> fetch<T>(_i7.RequestOptions? requestOptions) =>
      (super.noSuchMethod(Invocation.method(#fetch, [requestOptions]),
              returnValue: Future<_i7.Response<T>>.value(_FakeResponse_9<T>()))
          as _i8.Future<_i7.Response<T>>);
}
