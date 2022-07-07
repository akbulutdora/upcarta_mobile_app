import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({
    required this.endpoint,
    this.data = const {},
  });

  /// HTTP client
  static final _httpClient = http.Client();

  // Future<T> executeGet<T>(JsonParser<T> parser) async {
  Future<String> executeGet() async {
    final uri = Uri.parse(endpoint);
    final response = await _httpClient.get(uri);
    if (kDebugMode) {
      print(response.body);
    }
    return response.body;
    // return parser.parseFromJson(response.body);
  }

// Future<T> executePost<T>(JsonParser<T> parser) async {
  Future<String> executePost() async {
    final uri = Uri.parse(endpoint);
    final response = await _httpClient.post(
      uri,
      headers: {
        'Authorization': 'your_api_key',
      },
      body: data,
    );
    return response.body;
    // return parser.parseFromJson(response.body);
  }
}
