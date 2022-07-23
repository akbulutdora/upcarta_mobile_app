import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:logger/logger.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/token_storage.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  RemoteDataSource({Dio? dioClient})
      : _dioClient = dioClient ?? Dio()
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (RequestOptions options,
                  RequestInterceptorHandler handler) async {
                Logger().v(options.uri);
                Logger().d(options.headers);

                if (options.method == 'POST' || options.method == 'PATCH') {
                  dynamic data = options.data;
                  if (data is Map) {
                    Logger().d(data);
                  } else if (data is FormData) {
                    final map = <String, dynamic>{};
                    for (final file in data.files) {
                      map[file.key] =
                          '${file.value.filename} ${file.value.contentType}';
                    }
                    for (final field in data.fields) {
                      map[field.key] = field.value;
                    }
                    Logger().d(map);
                  }
                }

                return handler.next(options);
              },
              onResponse: (Response<dynamic> response,
                  ResponseInterceptorHandler handler) {
                Logger().v(
                    '(${response.statusCode}) - ${response.requestOptions.uri}');
                Logger().i(response.data);

                return handler.next(response);
              },
              onError: (DioError error, ErrorInterceptorHandler handler) {
                Logger().v(
                    '(${error.response?.statusCode}) - ${error.requestOptions.uri}');
                Logger().wtf(error.response?.toString());

                return handler.next(error);
              },
            ),
          )
          ..interceptors.add(_fresh);

  final Dio _dioClient;
  late String bearerToken;
  String baseURL = 'https://upcarta-staging.onrender.com/api/v1';

  static final _fresh = Fresh<String>(
    refreshToken: (token, httpClient) async {
      return '';
    },
    tokenStorage: UpcartaTokenStorage(),
    tokenHeader: (token) {
      return {
        'Authorization': 'Bearer $token',
      };
    },
    shouldRefresh: (response) {
      return false;
    },
  );

  Future<List?> login({required String email, required String password}) async {
    try {
      final response = await _dioClient.post<Map<String, dynamic>>(
        '$baseURL/sessions',
        data: {
          'session': {'email': email, 'password': password}
        },
      );

      if (response.statusCode == 200) {
        final token = response.data!['data']['jwt'];
        print(token);
        await _fresh.setToken(token);
        final user = response.data!['data']['user'];
        return [token, user];
      } else {
        throw ServerException();
      }
      // final parsedResponse = UserLoginResponse.fromJson(response.data!);
      // if (parsedResponse.meta?.successStatus != null) {
      //   if (parsedResponse.meta?.successStatus == true) {
      //     await _fresh.setToken(parsedResponse.data);
      //     return parsedResponse.data!;
      //   } else {
      //     throw ServerException();
      //   }
      // } else {
      //   throw ServerException();
      // }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<User> authenticate(
      {required String email, required String password}) async {
    // Uri uri = Uri.parse(baseURL + 'sessions');
    // http.Response response = await client.post(
    //   uri,
    //   headers: {'Content-Type': 'application/json'},
    //   body: {
    //     'session': {'email': 'hello@upcarta.com', 'password': '12345678'}
    //   },
    // );
    //
    // // TODO: IMPLEMENT DIO CLIENT
    // final dioRresponse = await _dioClient.post<Map<String, dynamic>>(
    //   '$baseURL/sessions',
    //   data: {
    //     'session': {'email': email, 'password': password}
    //   },
    // );
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> decoded = json.decode(response.body);
    //   var token = decoded['jwt'];
    //   bearerToken = token;
    //   User user = User.fromJson(decoded['user']);
    //   return user;
    // } else {
    //   throw ServerException();
    // }
    throw UnimplementedError();
  }

  Future<String> register({String? email, String? password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>?> getAllContents() async {
    final response =
    await _dioClient.get<Map<String, dynamic>>('$baseURL/contents/');
    if (kDebugMode) {
      print('response body: ${response.data}');
    }
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data!['data'];
      }
    }
    else {
      throw ServerException();
    }
    return null;
  }

  Future<Map<String, dynamic>?> getEntityById(int id) async {
    try {
      final response =
          await _dioClient.get<Map<String, dynamic>>('$baseURL/entities/$id');
      if (response.statusCode == 200) {
        if (response.data != null) {
          return response.data!['data'];
        }
      }
      else {
        throw ServerException();
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
