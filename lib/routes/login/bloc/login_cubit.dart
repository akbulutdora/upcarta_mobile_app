import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:core';
import 'package:upcarta_mobile_app/core/services/value_failure.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState.initial());

  final AuthenticationRepository _authRepository;

  void emailChanged(String value) {
    if (EmailAddress(value).value.isLeft()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: LoginStatus.validationFailure,
          emailValidated: false));
    } else if (state.password.value.isRight() &&
        EmailAddress(value).value.isRight()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: LoginStatus.validationSuccess,
          emailValidated: true,
          passwordValidated: true));
    } else if (EmailAddress(value).value.isRight()) {
      emit(state.copyWith(
          email: EmailAddress(value),
          status: LoginStatus.validationFailure,
          emailValidated: true));
    } else {
      emit(state.copyWith(
          email: EmailAddress(value), status: LoginStatus.initial));
    }
  }

  void passwordChanged(String value) {
    if (Password(value).value.isLeft()) {
      emit(state.copyWith(
          password: Password(value),
          status: LoginStatus.validationFailure,
          passwordValidated: false));
    } else if (Password(value).value.isRight() && state.email.value.isRight()) {
      emit(state.copyWith(
          password: Password(value),
          status: LoginStatus.validationSuccess,
          passwordValidated: true,
          emailValidated: true));
    } else if (Password(value).value.isRight()) {
      emit(state.copyWith(
          password: Password(value),
          status: LoginStatus.validationFailure,
          passwordValidated: true));
    } else {
      emit(state.copyWith(
          password: Password(value), status: LoginStatus.initial));
    }
  }

  Future<void> logInWithCredential() async {
    if (state.status == LoginStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time

    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: state.email.value.fold((l) => l.failedValue, (r) => r),
          password: state.password.value.fold((l) => l.failedValue, (r) => r));
      emit(state.copyWith(status: LoginStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: LoginStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    if (state.status == LoginStatus.submitting) {
      return;
    }
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      var googleExists = await _authRepository.logInWithGoogle();

      if (!googleExists) {
        emit(state.copyWith(status: LoginStatus.googleSignup)); // google signup
      } else {
        emit(state.copyWith(status: LoginStatus.success)); // google login
      }
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: LoginStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }
}
