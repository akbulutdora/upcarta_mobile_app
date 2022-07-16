// Mocks generated by Mockito 5.2.0 from annotations
// in upcarta_mobile_app/test/shared_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:dartz/dartz.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart'
    as _i4;
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart'
    as _i3;
import 'package:upcarta_mobile_app/core/error/failures.dart' as _i13;
import 'package:upcarta_mobile_app/core/platform/network_info.dart' as _i5;
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart' as _i8;
import 'package:upcarta_mobile_app/repositories/feed_repository.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i2.StreamedResponse {
}

class _FakeRemoteDataSource_2 extends _i1.Fake implements _i3.RemoteDataSource {
}

class _FakeLocalDataStorage_3 extends _i1.Fake implements _i4.LocalDataStorage {
}

class _FakeNetworkInfo_4 extends _i1.Fake implements _i5.NetworkInfo {}

class _FakeEither_5<L, R> extends _i1.Fake implements _i6.Either<L, R> {}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i3.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> authenticate({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(
              #authenticate, [], {#email: email, #password: password}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> register({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(
              #register, [], {#email: email, #password: password}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<List<_i8.Content>> getAllContents() =>
      (super.noSuchMethod(Invocation.method(#getAllContents, []),
              returnValue: Future<List<_i8.Content>>.value(<_i8.Content>[]))
          as _i7.Future<List<_i8.Content>>);
}

/// A class which mocks [LocalDataStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataStorage extends _i1.Mock implements _i4.LocalDataStorage {
  MockLocalDataStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> getUserToken() =>
      (super.noSuchMethod(Invocation.method(#getUserToken, []),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<void> cacheUserToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#cacheUserToken, [token]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
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
  _i7.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key, value]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> commit() =>
      (super.noSuchMethod(Invocation.method(#commit, []),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i7.Future<_i11.Uint8List>);
  @override
  _i7.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i7.Future<_i2.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [FeedRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeedRepository extends _i1.Mock implements _i12.FeedRepository {
  MockFeedRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(Invocation.getter(#remoteDataSource),
          returnValue: _FakeRemoteDataSource_2()) as _i3.RemoteDataSource);
  @override
  _i4.LocalDataStorage get localDataStorage =>
      (super.noSuchMethod(Invocation.getter(#localDataStorage),
          returnValue: _FakeLocalDataStorage_3()) as _i4.LocalDataStorage);
  @override
  _i5.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_4()) as _i5.NetworkInfo);
  @override
  String get userId =>
      (super.noSuchMethod(Invocation.getter(#userId), returnValue: '')
          as String);
  @override
  set userId(String? _userId) =>
      super.noSuchMethod(Invocation.setter(#userId, _userId),
          returnValueForMissingStub: null);
  @override
  _i7.Future<_i6.Either<_i13.Failure, _i6.IList<_i8.Content>>>
      getAllContents() => (super.noSuchMethod(
          Invocation.method(#getAllContents, []),
          returnValue:
              Future<_i6.Either<_i13.Failure, _i6.IList<_i8.Content>>>.value(
                  _FakeEither_5<_i13.Failure, _i6.IList<_i8.Content>>())) as _i7
          .Future<_i6.Either<_i13.Failure, _i6.IList<_i8.Content>>>);
}