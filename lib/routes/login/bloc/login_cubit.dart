import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// import 'package:upcarta_mobile_app/repositories/auth_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState.initial());

  final AuthenticationRepository _authRepository;

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logInWithCredential() async {
    if (state.status == LoginStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: state.email, password: state.password);
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
// TODO: IMPLEMENT GOOGLE SIGN IN
// Future<void> logInWithGoogle() async {
//   emit(state.copyWith(status: FormzStatus.submissionInProgress));
//   try {
//     await _authenticationRepository.logInWithGoogle();
//     emit(state.copyWith(status: FormzStatus.submissionSuccess));
//   } on LogInWithGoogleFailure catch (e) {
//     emit(
//       state.copyWith(
//         errorMessage: e.message,
//         status: FormzStatus.submissionFailure,
//       ),
//     );
//   } catch (_) {
//     emit(state.copyWith(status: FormzStatus.submissionFailure));
//   }
// }
}
