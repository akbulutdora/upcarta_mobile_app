// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return _ContentDetails.fromJson(json);
}

/// @nodoc
mixin _$ContentDetails {
  @JsonKey(name: 'number_of_pages')
  int? get numberOfPages => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  String? get asin => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;
  @JsonKey(name: 'isbn_13')
  String? get isbn13 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentDetailsCopyWith<ContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDetailsCopyWith<$Res> {
  factory $ContentDetailsCopyWith(
          ContentDetails value, $Res Function(ContentDetails) then) =
      _$ContentDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'number_of_pages') int? numberOfPages,
      double? duration,
      String? asin,
      String? isbn,
      @JsonKey(name: 'isbn_13') String? isbn13});
}

/// @nodoc
class _$ContentDetailsCopyWithImpl<$Res>
    implements $ContentDetailsCopyWith<$Res> {
  _$ContentDetailsCopyWithImpl(this._value, this._then);

  final ContentDetails _value;
  // ignore: unused_field
  final $Res Function(ContentDetails) _then;

  @override
  $Res call({
    Object? numberOfPages = freezed,
    Object? duration = freezed,
    Object? asin = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfPages: numberOfPages == freezed
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContentDetailsCopyWith<$Res>
    implements $ContentDetailsCopyWith<$Res> {
  factory _$$_ContentDetailsCopyWith(
          _$_ContentDetails value, $Res Function(_$_ContentDetails) then) =
      __$$_ContentDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'number_of_pages') int? numberOfPages,
      double? duration,
      String? asin,
      String? isbn,
      @JsonKey(name: 'isbn_13') String? isbn13});
}

/// @nodoc
class __$$_ContentDetailsCopyWithImpl<$Res>
    extends _$ContentDetailsCopyWithImpl<$Res>
    implements _$$_ContentDetailsCopyWith<$Res> {
  __$$_ContentDetailsCopyWithImpl(
      _$_ContentDetails _value, $Res Function(_$_ContentDetails) _then)
      : super(_value, (v) => _then(v as _$_ContentDetails));

  @override
  _$_ContentDetails get _value => super._value as _$_ContentDetails;

  @override
  $Res call({
    Object? numberOfPages = freezed,
    Object? duration = freezed,
    Object? asin = freezed,
    Object? isbn = freezed,
    Object? isbn13 = freezed,
  }) {
    return _then(_$_ContentDetails(
      numberOfPages: numberOfPages == freezed
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: isbn == freezed
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn13: isbn13 == freezed
          ? _value.isbn13
          : isbn13 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentDetails
    with DiagnosticableTreeMixin
    implements _ContentDetails {
  const _$_ContentDetails(
      {@JsonKey(name: 'number_of_pages') this.numberOfPages,
      this.duration,
      this.asin,
      this.isbn,
      @JsonKey(name: 'isbn_13') this.isbn13});

  factory _$_ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ContentDetailsFromJson(json);

  @override
  @JsonKey(name: 'number_of_pages')
  final int? numberOfPages;
  @override
  final double? duration;
  @override
  final String? asin;
  @override
  final String? isbn;
  @override
  @JsonKey(name: 'isbn_13')
  final String? isbn13;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentDetails(numberOfPages: $numberOfPages, duration: $duration, asin: $asin, isbn: $isbn, isbn13: $isbn13)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentDetails'))
      ..add(DiagnosticsProperty('numberOfPages', numberOfPages))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('asin', asin))
      ..add(DiagnosticsProperty('isbn', isbn))
      ..add(DiagnosticsProperty('isbn13', isbn13));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentDetails &&
            const DeepCollectionEquality()
                .equals(other.numberOfPages, numberOfPages) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.isbn, isbn) &&
            const DeepCollectionEquality().equals(other.isbn13, isbn13));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(numberOfPages),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(isbn),
      const DeepCollectionEquality().hash(isbn13));

  @JsonKey(ignore: true)
  @override
  _$$_ContentDetailsCopyWith<_$_ContentDetails> get copyWith =>
      __$$_ContentDetailsCopyWithImpl<_$_ContentDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentDetailsToJson(this);
  }
}

abstract class _ContentDetails implements ContentDetails {
  const factory _ContentDetails(
      {@JsonKey(name: 'number_of_pages') final int? numberOfPages,
      final double? duration,
      final String? asin,
      final String? isbn,
      @JsonKey(name: 'isbn_13') final String? isbn13}) = _$_ContentDetails;

  factory _ContentDetails.fromJson(Map<String, dynamic> json) =
      _$_ContentDetails.fromJson;

  @override
  @JsonKey(name: 'number_of_pages')
  int? get numberOfPages;
  @override
  double? get duration;
  @override
  String? get asin;
  @override
  String? get isbn;
  @override
  @JsonKey(name: 'isbn_13')
  String? get isbn13;
  @override
  @JsonKey(ignore: true)
  _$$_ContentDetailsCopyWith<_$_ContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
