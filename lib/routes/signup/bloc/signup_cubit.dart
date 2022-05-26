import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository _authRepository;
  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: value, status: SignupStatus.initial));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value, status: SignupStatus.initial));
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignupStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signUp(
          email: state.email,
          password: state.password,
          username: state.username,
          name: state.name);
      emit(state.copyWith(status: SignupStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: SignupStatus.submissionFailure,
        ),
      );
    } catch (_) {}
  }
}
