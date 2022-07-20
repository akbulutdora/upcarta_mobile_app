import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:core';
import 'package:upcarta_mobile_app/routes/login/bloc/value_failure.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState.initial());

  final AuthenticationRepository _authRepository;

  void emailChanged(String value) {
    if(state.email.value.isLeft()) {
      emit(state.copyWith(email: EmailAddress(value), status: LoginStatus.validationFailure, emailValidated: false));
    }
    else if (state.email.value.isRight())
      {
        emit(state.copyWith(email: EmailAddress(value), status: LoginStatus.validationFailure, emailValidated: true));

      }
    else if(state.password.value.isRight() && state.email.value.isRight())
      {
        emit(state.copyWith(email: EmailAddress(value), status: LoginStatus.validationSuccess, emailValidated: true));
      }

      else {
      emit(state.copyWith(email: EmailAddress(value), status: LoginStatus.initial));
    }
  }

  void passwordChanged(String value) {
    if(state.password.value.isLeft()) {
      emit(state.copyWith(password: Password(value), status: LoginStatus.validationFailure, passwordValidated: false));
    }
    else if(state.password.value.isRight())
      {
        emit(state.copyWith(password: Password(value), status: LoginStatus.validationFailure, passwordValidated: true));
      }
    else if(state.password.value.isRight() && state.email.value.isRight()){
      emit(state.copyWith(password: Password(value), status: LoginStatus.validationSuccess, passwordValidated: true));
    }
    else {
      emit(state.copyWith(password: Password(value), status: LoginStatus.initial));
    }
  }

  /*Future<void> _onLoginSubmitted(Emitter<LoginState> emit) async {
    final isEmailValid = state.email.value.isRight();
    final isPasswordValid = state.password.value.isRight();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: null,
        ),
      );

      // Perform network request to get a token.

      await Future.delayed(const Duration(seconds: 1));
    }
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: true,

        // Depending on the response received from the server after loggin in,
        // emit proper authFailureOrSuccess.

        // For now we will just see if the email and password were valid or not
        // and accordingly set authFailureOrSuccess' value.

        authFailureOrSuccess:
        (isEmailValid && isPasswordValid) ? right(unit) : null,
      ),
    );
  }*/
  Future<void> logInWithCredential() async {
    if (state.status == LoginStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time

    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: state.email.value.getOrElse(() => ''), password: state.password.value.getOrElse(() => ''));
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
