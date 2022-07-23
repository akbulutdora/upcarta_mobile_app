import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh/fresh.dart';

class UpcartaTokenStorage implements TokenStorage<String> {
  final storage = const FlutterSecureStorage();

  @override
  Future<void> delete() async {
    await storage.deleteAll();
  }

  @override
  Future<String?> read() async {
    // final token = await storage.read(key: 'token');
    //
    // if (token?.isNotEmpty ?? false) {
    //   return token;
    // }
    return 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzcG90YWJsZSIsImV4cCI6MTY2MDk5OTk0NSwiaWF0IjoxNjU4NTgwNzQ1LCJpc3MiOiJzcG90YWJsZSIsImp0aSI6ImUyN2Y1OTA2LTQ4N2EtNDhkOC1hNGZmLWM4NzA0ODQ2ZmYyYyIsIm5iZiI6MTY1ODU4MDc0NCwic3ViIjoiMSIsInR5cCI6ImFjY2VzcyJ9.8l36_smbo1R55k7Ka6-6KUbDsCUF8YGNAR5QTAgXIsvp7Cvl2WefRs8DMof9WmZUiz8PPNSqeTj1O2vCCm7BKg';
    return null;
  }

  @override
  Future<void> write(String token) async {
    // await storage.write(
    //   key: 'token',
    //   value: token,
    // );
  }
}