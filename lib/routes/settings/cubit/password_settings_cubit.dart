import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'password_settings_state.dart';

class PasswordSettingsCubit extends Cubit<PasswordSettingsState> {
  PasswordSettingsCubit(this._authRepository, this._userRepository)
      : super(PasswordSettingsState.initial());

  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: PasswordSettingsStatus.initial));
  }

  Future<void> changePasswordSubmitted() async {
    if (state.status == PasswordSettingsStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: PasswordSettingsStatus.submitting));
    try {
      await _userRepository.changePassword(state.password);
      emit(state.copyWith(status: PasswordSettingsStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          // TODO: HANDLE ERROR
          errorMessage: e.toString(),
          status: PasswordSettingsStatus.submissionFailure,
        ),
      );
    }
  }
}
