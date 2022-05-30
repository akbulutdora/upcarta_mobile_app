part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, submissionFailure }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final String name;
  final String? errorMessage;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    required this.name,
    this.errorMessage,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: "",
      password: "",
      status: SignupStatus.initial,
      name: "",
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? username,
    String? name,
    SignupStatus? status,
    String? errorMessage,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [email, password, name, status];
}
