// class ProfileParser extends JsonParser<Profile> with ObjectDecoder<Profile> {
//   const ProfileParser();
//   @override
//   Future<Profile> parseFromJson(String json) async {
//     final decoded = decodeJsonObject(json);
//     return Profile.fromJson(decoded);
//   }
// }