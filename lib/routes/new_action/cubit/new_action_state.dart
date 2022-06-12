part of 'new_action_cubit.dart';

enum ActionStatus { initial, submitting, success, submissionFailure }

class NewActionState extends Equatable {
  final String content;
  final String contentURL;
  final String contentTitle;
  final ActionStatus status;
  final String? errorMessage;

  const NewActionState({
    required this.content,
    required this.contentURL,
    required this.contentTitle,
    required this.status,
    this.errorMessage,
  });

  factory NewActionState.initial() {
    return const NewActionState(
        content:"", contentURL: "", contentTitle: "", status: ActionStatus.initial);
  }

  @override
  List<Object> get props => [content, contentURL, contentTitle, status];

  NewActionState copyWith({
    String? postContent,
    String? postTitle,
    String? postUrl,
    ActionStatus? status,
    String? errorMessage,
  }) {
    return NewActionState(
        //contentURL: postContent ?? this.contentURL,
        contentTitle: postTitle ?? this.contentTitle,
        content: postContent ?? this.content,
        contentURL: postUrl ?? this.contentURL,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
