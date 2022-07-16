// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentTopic _$ContentTopicFromJson(Map<String, dynamic> json) {
  return _ContentTopic.fromJson(json);
}

/// @nodoc
mixin _$ContentTopic {
  int? get id =>
      throw _privateConstructorUsedError; // TODO: content topic contentin icerisinde yer aliyor(? mu) bunun nasil yapildigina bak
  Content? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_id', required: true)
  int get contentId => throw _privateConstructorUsedError;
  Topic? get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'topic_id', required: true)
  int get topicId => throw _privateConstructorUsedError;
  int? get pos => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by')
  User? get addedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_by_id')
  int? get addedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentTopicCopyWith<ContentTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentTopicCopyWith<$Res> {
  factory $ContentTopicCopyWith(
          ContentTopic value, $Res Function(ContentTopic) then) =
      _$ContentTopicCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      Content? content,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Topic? topic,
      @JsonKey(name: 'topic_id', required: true) int topicId,
      int? pos,
      @JsonKey(name: 'added_by') User? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $ContentCopyWith<$Res>? get content;
  $TopicCopyWith<$Res>? get topic;
  $UserCopyWith<$Res>? get addedBy;
}

/// @nodoc
class _$ContentTopicCopyWithImpl<$Res> implements $ContentTopicCopyWith<$Res> {
  _$ContentTopicCopyWithImpl(this._value, this._then);

  final ContentTopic _value;
  // ignore: unused_field
  final $Res Function(ContentTopic) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? topic = freezed,
    Object? topicId = freezed,
    Object? pos = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $ContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value));
    });
  }

  @override
  $TopicCopyWith<$Res>? get topic {
    if (_value.topic == null) {
      return null;
    }

    return $TopicCopyWith<$Res>(_value.topic!, (value) {
      return _then(_value.copyWith(topic: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get addedBy {
    if (_value.addedBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.addedBy!, (value) {
      return _then(_value.copyWith(addedBy: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContentTopicCopyWith<$Res>
    implements $ContentTopicCopyWith<$Res> {
  factory _$$_ContentTopicCopyWith(
          _$_ContentTopic value, $Res Function(_$_ContentTopic) then) =
      __$$_ContentTopicCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      Content? content,
      @JsonKey(name: 'content_id', required: true) int contentId,
      Topic? topic,
      @JsonKey(name: 'topic_id', required: true) int topicId,
      int? pos,
      @JsonKey(name: 'added_by') User? addedBy,
      @JsonKey(name: 'added_by_id') int? addedById,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $ContentCopyWith<$Res>? get content;
  @override
  $TopicCopyWith<$Res>? get topic;
  @override
  $UserCopyWith<$Res>? get addedBy;
}

/// @nodoc
class __$$_ContentTopicCopyWithImpl<$Res>
    extends _$ContentTopicCopyWithImpl<$Res>
    implements _$$_ContentTopicCopyWith<$Res> {
  __$$_ContentTopicCopyWithImpl(
      _$_ContentTopic _value, $Res Function(_$_ContentTopic) _then)
      : super(_value, (v) => _then(v as _$_ContentTopic));

  @override
  _$_ContentTopic get _value => super._value as _$_ContentTopic;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? contentId = freezed,
    Object? topic = freezed,
    Object? topicId = freezed,
    Object? pos = freezed,
    Object? addedBy = freezed,
    Object? addedById = freezed,
    Object? insertedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ContentTopic(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic?,
      topicId: topicId == freezed
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as int?,
      addedBy: addedBy == freezed
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      addedById: addedById == freezed
          ? _value.addedById
          : addedById // ignore: cast_nullable_to_non_nullable
              as int?,
      insertedAt: insertedAt == freezed
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentTopic with DiagnosticableTreeMixin implements _ContentTopic {
  const _$_ContentTopic(
      {this.id,
      this.content,
      @JsonKey(name: 'content_id', required: true) required this.contentId,
      this.topic,
      @JsonKey(name: 'topic_id', required: true) required this.topicId,
      this.pos,
      @JsonKey(name: 'added_by') this.addedBy,
      @JsonKey(name: 'added_by_id') this.addedById,
      @JsonKey(name: 'inserted_at') this.insertedAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_ContentTopic.fromJson(Map<String, dynamic> json) =>
      _$$_ContentTopicFromJson(json);

  @override
  final int? id;
// TODO: content topic contentin icerisinde yer aliyor(? mu) bunun nasil yapildigina bak
  @override
  final Content? content;
  @override
  @JsonKey(name: 'content_id', required: true)
  final int contentId;
  @override
  final Topic? topic;
  @override
  @JsonKey(name: 'topic_id', required: true)
  final int topicId;
  @override
  final int? pos;
  @override
  @JsonKey(name: 'added_by')
  final User? addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  final int? addedById;
  @override
  @JsonKey(name: 'inserted_at')
  final DateTime? insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContentTopic(id: $id, content: $content, contentId: $contentId, topic: $topic, topicId: $topicId, pos: $pos, addedBy: $addedBy, addedById: $addedById, insertedAt: $insertedAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContentTopic'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('topic', topic))
      ..add(DiagnosticsProperty('topicId', topicId))
      ..add(DiagnosticsProperty('pos', pos))
      ..add(DiagnosticsProperty('addedBy', addedBy))
      ..add(DiagnosticsProperty('addedById', addedById))
      ..add(DiagnosticsProperty('insertedAt', insertedAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentTopic &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            const DeepCollectionEquality().equals(other.topicId, topicId) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality().equals(other.addedBy, addedBy) &&
            const DeepCollectionEquality().equals(other.addedById, addedById) &&
            const DeepCollectionEquality()
                .equals(other.insertedAt, insertedAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(topic),
      const DeepCollectionEquality().hash(topicId),
      const DeepCollectionEquality().hash(pos),
      const DeepCollectionEquality().hash(addedBy),
      const DeepCollectionEquality().hash(addedById),
      const DeepCollectionEquality().hash(insertedAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ContentTopicCopyWith<_$_ContentTopic> get copyWith =>
      __$$_ContentTopicCopyWithImpl<_$_ContentTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentTopicToJson(this);
  }
}

abstract class _ContentTopic implements ContentTopic {
  const factory _ContentTopic(
      {final int? id,
      final Content? content,
      @JsonKey(name: 'content_id', required: true)
          required final int contentId,
      final Topic? topic,
      @JsonKey(name: 'topic_id', required: true)
          required final int topicId,
      final int? pos,
      @JsonKey(name: 'added_by')
          final User? addedBy,
      @JsonKey(name: 'added_by_id')
          final int? addedById,
      @JsonKey(name: 'inserted_at')
          final DateTime? insertedAt,
      @JsonKey(name: 'updated_at')
          final DateTime? updatedAt}) = _$_ContentTopic;

  factory _ContentTopic.fromJson(Map<String, dynamic> json) =
      _$_ContentTopic.fromJson;

  @override
  int? get id;
  @override // TODO: content topic contentin icerisinde yer aliyor(? mu) bunun nasil yapildigina bak
  Content? get content;
  @override
  @JsonKey(name: 'content_id', required: true)
  int get contentId;
  @override
  Topic? get topic;
  @override
  @JsonKey(name: 'topic_id', required: true)
  int get topicId;
  @override
  int? get pos;
  @override
  @JsonKey(name: 'added_by')
  User? get addedBy;
  @override
  @JsonKey(name: 'added_by_id')
  int? get addedById;
  @override
  @JsonKey(name: 'inserted_at')
  DateTime? get insertedAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ContentTopicCopyWith<_$_ContentTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
