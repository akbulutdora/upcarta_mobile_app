import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';

// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    if (EmailAddress(value).value.isLeft()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: SignupStatus.validationFailure,
          emailValidated: false));
    } else if (state.password.value.isRight() &&
        EmailAddress(value).value.isRight() &&
        state.name.value.isRight()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: SignupStatus.validationSuccess,
          emailValidated: true,
          passwordValidated: true,
          nameValidated: true));
    } else if (EmailAddress(value).value.isRight()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: SignupStatus.validationFailure,
          emailValidated: true));
    } else {
      emit(state.copyWith(
          email: EmailAddress(value), status: SignupStatus.initial));
    }
  }

  void passwordChanged(String value) {
    if (Password(value).value.isLeft()) {
      emit(state.copyWith(
          password: Password(value),
          status: SignupStatus.validationFailure,
          passwordValidated: false));
    } else if (Password(value).value.isRight() &&
        state.email.value.isRight() &&
        state.name.value.isRight()) {
      emit(state.copyWith(
          password: Password(value),
          status: SignupStatus.validationSuccess,
          passwordValidated: true,
          emailValidated: true,
          nameValidated: true));
    } else if (Password(value).value.isRight()) {
      emit(state.copyWith(
          password: Password(value),
          status: SignupStatus.validationFailure,
          passwordValidated: true));
    } else {
      emit(state.copyWith(
          password: Password(value), status: SignupStatus.initial));
    }
  }

  void nameChanged(String value) {
    if (Name(value).value.isLeft()) {
      emit(state.copyWith(
          name: Name(value),
          status: SignupStatus.validationFailure,
          nameValidated: false));
    } else if (state.password.value.isRight() &&
        state.email.value.isRight() &&
        Name(value).value.isRight()) {
      emit(state.copyWith(
          name: Name(value),
          status: SignupStatus.validationSuccess,
          passwordValidated: true,
          emailValidated: true,
          nameValidated: true));
    } else if (Name(value).value.isRight()) {
      emit(state.copyWith(
          name: Name(value),
          status: SignupStatus.validationFailure,
          nameValidated: true));
    } else {
      emit(state.copyWith(name: Name(value), status: SignupStatus.initial));
    }
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignupStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signUp(
          email: state.email.value.fold((l) => l.failedValue, (r) => r),
          password: state.password.value.fold((l) => l.failedValue, (r) => r),
          name: state.name.value.fold((l) => l.failedValue, (r) => r));
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
