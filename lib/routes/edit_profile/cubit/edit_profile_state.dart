part of 'edit_profile_cubit.dart';

enum EditProfileStatus { initial, submitting, success, submissionFailure }

class EditProfileState extends Equatable {
  final String bio;
  final String photoURL;
  final EditProfileStatus status;
  final String? errorMessage;

  const EditProfileState({
    required this.bio,
    required this.photoURL,
    required this.status,
    this.errorMessage,
  });

  @override
  List<Object> get props => [bio, photoURL, status];

  factory EditProfileState.initial() {
    return const EditProfileState(
        bio: "", photoURL: "", status: EditProfileStatus.initial);
  }

  EditProfileState copyWith({
    String? bio,
    String? photoURL,
    EditProfileStatus? status,
    String? errorMessage,
  }) {
    return EditProfileState(
        bio: bio ?? this.bio,
        photoURL: photoURL ?? this.photoURL,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
