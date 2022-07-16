// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:upcarta_mobile_app/models/content/contribution.dart';
// import 'package:upcarta_mobile_app/models/entity/entity.dart';
// import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
// import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
// import 'package:upcarta_mobile_app/models/content/platform.dart';
//
// part 'curation.freezed.dart';
//
// part 'curation.g.dart';
//
// //ayni enumlari farkli isimlendirmek lazim mi farkli bir yerde mi tutmaliydik
// enum CurationCreatedAtAccuracy{
//   @JsonValue('year')
//   year,
//   @JsonValue('month')
//   month,
//   @JsonValue('day')
//   day,
//   @JsonValue('hour')
//   hour,
// }
// enum CurationType{
//   @JsonValue('internal')
//   internal,
//   @JsonValue('external')
//   external,
//   @JsonValue('internal_collection')
//   internalCollection,
//   @JsonValue('external_collection')
//   externalCollection,
//   @JsonValue('internal_ask')
//   internalAsk,
//   @JsonValue('external_ask')
//   externalAsk,
//   @JsonValue('later')
//   later,
//   @JsonValue('finished')
//   finished,
// }
// // TODO : collectiondan sonra ac
// // @freezed
// class Curation with _$Curation {
//   const factory Curation({
//     int? id,
//     @JsonKey(name: 'entity_id',required: true)required int entityId,
//     Entity? entity,
//     @JsonKey(name: 'created_at') DateTime? createdAt,
//     @JsonKey(name: 'created_at_accuracy') CurationCreatedAtAccuracy? createdAtAccuracy,
//     @JsonKey(name: 'created_at_str') String? createdAtStr,
//     @JsonKey(name: 'content_id', required: true)required int contentId,
//     Content? content,
//     @JsonKey(name: 'added_by') Entity? addedBy,
//     @JsonKey(name: 'added_by_id') int? addedById,
//     required CurationType type,
//     @JsonKey(name: 'verified_at') DateTime? verifiedAt,
//     @JsonKey(name: 'featured_at') DateTime? featuredAt,
//     @JsonKey(name: 'undecided_at') DateTime? undecidedAt,
//     String? link,
//     String? comment,
//     int? pos,
//     @JsonKey(name: 'platform_id') int? platformId,
//     Platform? platform,
//     @JsonKey(name: 'collection_id')int? collectionId,
//     // TODO : collection modeli tekrar yazilacak
//     Collection? collection,
//     @JsonKey(name: 'source_content_id') int? sourceContentId,
//     // TODO : source content neyi tutuyor
//     @JsonKey(name: 'source_content') Content? sourceContent,
//
//   }) = _Curation;
//
//   factory Curation.fromJson(Map<String, Object?> json) => _$CurationFromJson(json);
// }
