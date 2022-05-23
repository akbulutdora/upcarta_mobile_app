part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final String username;
  final String name;
  const SignupState({
    required this.email,
    required this.password,
    required this.status,
    required this.username,
    required this.name,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: "",
      password: "",
      status: SignupStatus.initial,
      username: "",
      name: "",
    );
  }
  SignupState copyWith({
    String? email,
    String? password,
    String? username,
    String? name,
    SignupStatus? status,
  }) {
    return SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        name: name ?? this.name,
        username: username ?? this.username);
  }

  @override
  List<Object> get props => [email, password, username, name, status];
}
