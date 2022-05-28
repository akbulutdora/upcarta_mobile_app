part of 'onboarding_cubit.dart';

enum OnboardingStatus { initial, submitting, success, submissionFailure }

class OnboardingState extends Equatable {
  final String bio;
  final String photoURL;
  final String id;
  final String username;
  final OnboardingStatus status;
  final String? errorMessage;
  const OnboardingState(
      {required this.bio,
      required this.status,
      required this.photoURL,
      required this.id,
      required this.username,
      this.errorMessage});

  factory OnboardingState.initial() {
    return const OnboardingState(
        bio: "",
        photoURL: "",
        id: "",
        username: "",
        status: OnboardingStatus.initial);
  }
  @override
  List<Object> get props => [bio, photoURL, status, username];

  OnboardingState copyWith({
    String? bio,
    String? photoURL,
    String? id,
    String? username,
    OnboardingStatus? status,
    String? errorMessage,
  }) {
    return OnboardingState(
        bio: bio ?? this.bio,
        photoURL: photoURL ?? this.photoURL,
        username: username ?? this.username,
        status: status ?? this.status,
        id: id ?? this.id,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
