import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/entity_repository/entity_repository.dart';
import 'package:upcarta_mobile_app/repositories/feed_repository.dart';

@GenerateMocks(
    [
      NetworkInfo,
      RemoteDataSource,
      LocalDataStorage,
      SharedPreferences,
      FeedRepository,
      EntityRepository,
      AuthenticationRepository,
      Dio
    ])
import 'shared_mocks.mocks.dart';

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  mockRemoteDataSource.toString();

}
