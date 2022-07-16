import 'dart:convert';

import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/core/api/http_client.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> authenticate({String? email, String? password});

  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> register({String email, String password});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<String> authenticate({String? email, String? password}) async {
    Uri uri = Uri.parse('https://upcarta-staging.onrender.com/api/v1/sessions');
    http.Response response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: {
        'session': {'email': 'hello@upcarta.com', 'password': '12345678'}
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> decoded = json.decode(response.body);
      return decoded['jwt'];
    }
    else {
      throw ServerException();
    }
  }

  @override
  Future<String> register({String? email, String? password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
