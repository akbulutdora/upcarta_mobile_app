// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
mixin _$Channel {
  int? get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities => throw _privateConstructorUsedError;
  ChannelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String link,
      @JsonKey(name: 'channel_entities') List<Entity>? channelEntities,
      ChannelType? type});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  final Channel _value;
  // ignore: unused_field
  final $Res Function(Channel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? channelEntities = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      channelEntities: channelEntities == freezed
          ? _value.channelEntities
          : channelEntities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChannelType?,
    ));
  }
}

/// @nodoc
abstract class _$$_ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$$_ChannelCopyWith(
          _$_Channel value, $Res Function(_$_Channel) then) =
      __$$_ChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String link,
      @JsonKey(name: 'channel_entities') List<Entity>? channelEntities,
      ChannelType? type});
}

/// @nodoc
class __$$_ChannelCopyWithImpl<$Res> extends _$ChannelCopyWithImpl<$Res>
    implements _$$_ChannelCopyWith<$Res> {
  __$$_ChannelCopyWithImpl(_$_Channel _value, $Res Function(_$_Channel) _then)
      : super(_value, (v) => _then(v as _$_Channel));

  @override
  _$_Channel get _value => super._value as _$_Channel;

  @override
  $Res call({
    Object? id = freezed,
    Object? link = freezed,
    Object? channelEntities = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Channel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      channelEntities: channelEntities == freezed
          ? _value._channelEntities
          : channelEntities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChannelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Channel with DiagnosticableTreeMixin implements _Channel {
  const _$_Channel(
      {this.id,
      required this.link,
      @JsonKey(name: 'channel_entities') final List<Entity>? channelEntities,
      this.type})
      : _channelEntities = channelEntities;

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelFromJson(json);

  @override
  final int? id;
  @override
  final String link;
  final List<Entity>? _channelEntities;
  @override
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities {
    final value = _channelEntities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ChannelType? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Channel(id: $id, link: $link, channelEntities: $channelEntities, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Channel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('channelEntities', channelEntities))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Channel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality()
                .equals(other._channelEntities, _channelEntities) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(_channelEntities),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ChannelCopyWith<_$_Channel> get copyWith =>
      __$$_ChannelCopyWithImpl<_$_Channel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelToJson(this);
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {final int? id,
      required final String link,
      @JsonKey(name: 'channel_entities') final List<Entity>? channelEntities,
      final ChannelType? type}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  int? get id;
  @override
  String get link;
  @override
  @JsonKey(name: 'channel_entities')
  List<Entity>? get channelEntities;
  @override
  ChannelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$_ChannelCopyWith<_$_Channel> get copyWith =>
      throw _privateConstructorUsedError;
}
