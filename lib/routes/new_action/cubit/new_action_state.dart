part of 'new_action_cubit.dart';

enum ActionStatus { initial, submitting, success, submissionFailure }

class NewActionState extends Equatable {
  final String content;
  final String contentURL;
  final String contentTtile;
  final ActionStatus status;
  final String? errorMessage;

  const NewActionState({
    required this.content,
    required this.contentURL,
    required this.contentTtile,
    required this.status,
    this.errorMessage,
  });

  factory NewActionState.initial() {
    return const NewActionState(
        content:"", contentURL: "", contentTtile: "", status: ActionStatus.initial);
  }

  @override
  List<Object> get props => [content, contentURL, contentTtile, status];

  NewActionState copyWith({
    String? postContent,
    String? postTitle,
    String? postUrl,
    ActionStatus? status,
    String? errorMessage,
  }) {
    return NewActionState(
        //contentURL: postContent ?? this.contentURL,
        contentTtile: postTitle ?? this.contentTtile,
        content: postContent ?? this.content,
        contentURL: postUrl ?? this.contentURL,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
