// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentDetails _$$_ContentDetailsFromJson(Map<String, dynamic> json) =>
    _$_ContentDetails(
      numberOfPages: json['number_of_pages'] as int?,
      duration: (json['duration'] as num?)?.toDouble(),
      asin: json['asin'] as String?,
      isbn: json['isbn'] as String?,
      isbn13: json['isbn_13'] as String?,
    );

Map<String, dynamic> _$$_ContentDetailsToJson(_$_ContentDetails instance) =>
    <String, dynamic>{
      'number_of_pages': instance.numberOfPages,
      'duration': instance.duration,
      'asin': instance.asin,
      'isbn': instance.isbn,
      'isbn_13': instance.isbn13,
    };
