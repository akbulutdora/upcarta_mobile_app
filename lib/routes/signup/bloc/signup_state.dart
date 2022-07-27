part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, submissionFailure, validationFailure,
  validationSuccess }

class SignupState extends Equatable {
  final EmailAddress email;
  final Password password;
  final SignupStatus status;
  final Name name;
  final String? errorMessage;
  final bool passwordValidated;
  final bool emailValidated;
  final bool nameValidated;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    required this.name,
    this.errorMessage,
    required this.emailValidated,
    required this.passwordValidated,
    required this.nameValidated
  });

  factory SignupState.initial() {
    return SignupState(
      email: EmailAddress(''),
      password: Password(''),
      status: SignupStatus.initial,
      name: Name(''),
      emailValidated: false,
      passwordValidated: false,
      nameValidated: false
    );
  }

  SignupState copyWith({
    EmailAddress? email,
    Password? password,
    String? username,
    Name? name,
    SignupStatus? status,
    String? errorMessage,
    bool? passwordValidated,
    bool? emailValidated,
    bool? nameValidated
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      name: name ?? this.name,
      passwordValidated: passwordValidated ?? this.passwordValidated,
      emailValidated: emailValidated ?? this.emailValidated,
      nameValidated: nameValidated ?? this.nameValidated,
    );
  }

  @override
  List<Object> get props => [email, password, name, status, emailValidated,passwordValidated, nameValidated];
}
