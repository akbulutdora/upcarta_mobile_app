part of 'onboarding_cubit.dart';

enum OnboardingStatus { initial, submitting, success, submissionFailure }

class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];

  OnboardingState.initial();
}
