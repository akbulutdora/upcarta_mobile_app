import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final UserRepository _userRepository;
  OnboardingCubit(this._userRepository) : super(OnboardingState.initial());

  void bioChanged(String bio) {
    emit(state.copyWith(bio: bio, status: OnboardingStatus.initial));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: OnboardingStatus.initial));
  }

  void submitBioPhotoURLUsername() async {
    if (state.status == OnboardingStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: OnboardingStatus.submitting));
    try {
      await _userRepository.changeBio(state.bio);
      await _userRepository.changePhoto(state.photoURL);
      await _userRepository.changeUsername(state.username);
      emit(state.copyWith(status: OnboardingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: OnboardingStatus.submissionFailure,
        ),
      );
    }
  }

  void followUserWithID() async {
    if (state.status == OnboardingStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: OnboardingStatus.submitting));
    try {
      await _userRepository.followUserWithID(state.id);
      emit(state.copyWith(status: OnboardingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: OnboardingStatus.submissionFailure,
        ),
      );
    }
  }

  void unfollowUserWithID() async {
    if (state.status == OnboardingStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: OnboardingStatus.submitting));
    try {
      await _userRepository.unfollowUserWithID(state.id);
      emit(state.copyWith(status: OnboardingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: OnboardingStatus.submissionFailure,
        ),
      );
    }
  }

  void followTopic() async {
    if (state.status == OnboardingStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: OnboardingStatus.submitting));
    try {
      await _userRepository.followTopicWithID(state.id);
      emit(state.copyWith(status: OnboardingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: OnboardingStatus.submissionFailure,
        ),
      );
    }
  }

  void unFollowTopic() async {
    if (state.status == OnboardingStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: OnboardingStatus.submitting));
    try {
      await _userRepository.unfollowTopicWithID(state.id);
      emit(state.copyWith(status: OnboardingStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: OnboardingStatus.submissionFailure,
        ),
      );
    }
  }
}
