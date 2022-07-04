part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  submissionFailure,
  googleSignup
}

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final String? errorMessage;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      this.errorMessage});

  factory LoginState.initial() {
    return const LoginState(
        email: '', password: '', status: LoginStatus.initial);
  }

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
