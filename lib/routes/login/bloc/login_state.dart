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
        email: EmailAddress(''), password: Password(''), status: LoginStatus.initial, emailValidated: false, passwordValidated: false);
  }
  @override
  List<Object> get props => [email, password, status,emailValidated,passwordValidated];

  LoginState copyWith({
    EmailAddress? email,
    Password? password,
    LoginStatus? status,
    String? errorMessage,
    bool? passwordValidated,
    bool? emailValidated
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
    passwordValidated: passwordValidated ?? this.passwordValidated,
    emailValidated: emailValidated ?? this.emailValidated);
  }
}
///TODO: email and pw validation-> in case of error show error message & respond in ui
class EmailAddress extends Equatable {
  factory EmailAddress(String input) =>
      EmailAddress._(_validateEmailAddress(input));

  const EmailAddress._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidEmail(failedValue: input),
    );
  }
}
class Password extends Equatable {
  factory Password(String input) => Password._(_validatePassword(input));

  const Password._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validatePassword(String input) {
  if (input.length >= 8) {
    return right(input);
  } else {
    return left(
      ValueFailure.shortPassword(failedValue: input),
    );
  }
}