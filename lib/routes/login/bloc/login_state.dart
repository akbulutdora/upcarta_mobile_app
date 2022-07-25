part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  submissionFailure,
  googleSignup,
  validationFailure,
  validationSuccess
}

class LoginState extends Equatable {
  final EmailAddress email;
  final Password password;
  final LoginStatus status;
  final String? errorMessage;
  final bool passwordValidated;
  final bool emailValidated;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      this.errorMessage,
      required this.emailValidated,
      required this.passwordValidated});

  factory LoginState.initial() {
    return LoginState(
        email: EmailAddress(''),
        password: Password(''),
        status: LoginStatus.initial,
        emailValidated: false,
        passwordValidated: false);
  }
  @override
  List<Object> get props =>
      [email, password, status, emailValidated, passwordValidated];

  LoginState copyWith(
      {EmailAddress? email,
      Password? password,
      LoginStatus? status,
      String? errorMessage,
      bool? passwordValidated,
      bool? emailValidated}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        emailValidated: emailValidated ?? this.emailValidated);
  }
}
