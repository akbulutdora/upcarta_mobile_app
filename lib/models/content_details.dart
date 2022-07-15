import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity.dart';
import 'package:upcarta_mobile_app/models/identity.dart';

part 'content_details.freezed.dart';

part 'content_details.g.dart';


@freezed
class ContentDetails with _$ContentDetails {
  const factory ContentDetails({
    @JsonKey(name: 'number_of_pages') int? numberOfPages,
    double? duration,
    String? asin,
    String? isbn,
    @JsonKey(name: 'isbn_13') String? isbn13,
  }) = _ContentDetails;

  factory ContentDetails.fromJson(Map<String, Object?> json) => _$ContentDetailsFromJson(json);
}
