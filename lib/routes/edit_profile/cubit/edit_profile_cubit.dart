import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._authRepository, this._userRepository)
      : super(EditProfileState.initial());

  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;

  void bioChanged(String value) {
    emit(state.copyWith(bio: value, status: EditProfileStatus.initial));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: EditProfileStatus.initial));
  }

  Future<void> editProfileSubmitted() async {
    if (state.status == EditProfileStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: EditProfileStatus.submitting));
    try {
      await _userRepository.changeBio(state.bio);
      await _userRepository.changeUsername(state.username);
      emit(state.copyWith(status: EditProfileStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          // TODO: HANDLE ERROR
          errorMessage: "An error occured",
          status: EditProfileStatus.submissionFailure,
        ),
      );
    }
  }

  void photoURLChanged(String value) {
    emit(state.copyWith(photoURL: value, status: EditProfileStatus.initial));
  }
}
