library json_parser;

// export "post_parser.dart";
export 'profile_parser.dart';
export 'object_decoder.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}
