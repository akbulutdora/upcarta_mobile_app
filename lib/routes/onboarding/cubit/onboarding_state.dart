part of 'onboarding_cubit.dart';

enum OnboardingStatus { initial, submitting, success, submissionFailure, validationFailure,
  validationSuccess }

class OnboardingState extends Equatable {
  final String bio;
  final String photoURL;
  final String id;
  final Username username;
  final OnboardingStatus status;
  final String? errorMessage;
  final bool usernameValidated;
  const OnboardingState(
      {required this.bio,
      required this.status,
      required this.photoURL,
      required this.id,
      required this.username,
      this.errorMessage,
      required this.usernameValidated});

  factory OnboardingState.initial() {
    return OnboardingState(
        bio: '',
        photoURL: '',
        id: '',
        username: Username(''),
        status: OnboardingStatus.initial,
    usernameValidated: false);
  }
  @override
  List<Object> get props => [bio, photoURL, status, username, usernameValidated];

  OnboardingState copyWith({
    String? bio,
    String? photoURL,
    String? id,
    Username? username,
    OnboardingStatus? status,
    String? errorMessage,
    bool? usernameValidated
  }) {
    return OnboardingState(
        bio: bio ?? this.bio,
        photoURL: photoURL ?? this.photoURL,
        username: username ?? this.username,
        status: status ?? this.status,
        id: id ?? this.id,
        errorMessage: errorMessage ?? this.errorMessage,
    usernameValidated: usernameValidated ?? this.usernameValidated);
  }
}
