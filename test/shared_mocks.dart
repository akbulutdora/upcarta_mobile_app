import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';

@GenerateMocks(
    [NetworkInfo, RemoteDataSource, LocalDataStorage, SharedPreferences])
import 'shared_mocks.mocks.dart';

void main() {
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  mockRemoteDataSource.toString();
}
