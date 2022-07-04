part of 'password_settings_cubit.dart';

enum PasswordSettingsStatus { initial, submitting, success, submissionFailure }

class PasswordSettingsState extends Equatable {
  final String password;
  final PasswordSettingsStatus status;
  final String? errorMessage;

  const PasswordSettingsState({
    required this.password,
    required this.status,
    this.errorMessage,
  });

  @override
  List<Object> get props => [password, status];

  factory PasswordSettingsState.initial() {
    return const PasswordSettingsState(
        password: '', status: PasswordSettingsStatus.initial);
  }

  PasswordSettingsState copyWith({
    String? password,
    PasswordSettingsStatus? status,
    String? errorMessage,
  }) {
    return PasswordSettingsState(
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
