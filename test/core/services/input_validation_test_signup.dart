import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/signup/signup.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late MockAuthRepo mockAuthRepo;
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });
  blocTest<SignupCubit, SignupState>(
    'email unval->val',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('e_@g.'),
        password: Password('12341234'),
        status: SignupStatus.validationFailure,
        name: Name('k'),
        emailValidated: false,
        passwordValidated: true,
        nameValidated: true),
    act: (cubit) => cubit.emailChanged('e_@g.y'),
    expect: () => {
      SignupState(
          email: EmailAddress('e_@g.y'),
          password: Password('12341234'),
          status: SignupStatus.validationSuccess,
          name: Name('k'),
          emailValidated: true,
          passwordValidated: true,
          nameValidated: true),
    },
  );
  blocTest<SignupCubit, SignupState>(
    'email val->unval',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('e_@g.y'),
        password: Password('12341234'),
        status: SignupStatus.validationSuccess,
        name: Name('k'),
        emailValidated: true,
        passwordValidated: true,
        nameValidated: true),
    act: (cubit) => cubit.emailChanged('e_@g.'),
    expect: () => {
      SignupState(
          email: EmailAddress('e_@g.'),
          password: Password('12341234'),
          status: SignupStatus.validationFailure,
          name: Name('k'),
          emailValidated: false,
          passwordValidated: true,
          nameValidated: true),
    },
  );
  blocTest<SignupCubit, SignupState>(
    'pass unval->val',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('eee@g.c'),
        password: Password('1234123'),
        status: SignupStatus.validationFailure,
        name: Name('k'),
        emailValidated: true,
        passwordValidated: false,
        nameValidated: true),
    act: (cubit) => cubit.passwordChanged('12341234'),
    expect: () => {
      SignupState(
          email: EmailAddress('eee@g.c'),
          password: Password('12341234'),
          status: SignupStatus.validationSuccess,
          name: Name('k'),
          emailValidated: true,
          passwordValidated: true,
          nameValidated: true),
    },
  );
  blocTest<SignupCubit, SignupState>(
    'pass val->unval',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('eee@g.c'),
        password: Password('12341234'),
        status: SignupStatus.validationSuccess,
        name: Name('k'),
        emailValidated: true,
        passwordValidated: true,
        nameValidated: true),
    act: (cubit) => cubit.passwordChanged('1234123'),
    expect: () => {
      SignupState(
          email: EmailAddress('eee@g.c'),
          password: Password('1234123'),
          status: SignupStatus.validationFailure,
          name: Name('k'),
          emailValidated: true,
          passwordValidated: false,
          nameValidated: true),
    },
  );
  blocTest<SignupCubit, SignupState>(
    'name unval->val',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('eee@g.c'),
        password: Password('12341234'),
        status: SignupStatus.validationFailure,
        name: Name(''),
        emailValidated: true,
        passwordValidated: true,
        nameValidated: false),
    act: (cubit) => cubit.nameChanged('k'),
    expect: () => {
      SignupState(
          email: EmailAddress('eee@g.c'),
          password: Password('12341234'),
          status: SignupStatus.validationSuccess,
          name: Name('k'),
          emailValidated: true,
          passwordValidated: true,
          nameValidated: true),
    },
  );
  blocTest<SignupCubit, SignupState>(
    'name val->unval',
    build: () => SignupCubit(mockAuthRepo),
    seed: () => SignupState(
        email: EmailAddress('eee@g.c'),
        password: Password('12341234'),
        status: SignupStatus.validationSuccess,
        name: Name('k'),
        emailValidated: true,
        passwordValidated: true,
        nameValidated: true),
    act: (cubit) => cubit.nameChanged(''),
    expect: () => {
      SignupState(
          email: EmailAddress('eee@g.c'),
          password: Password('12341234'),
          status: SignupStatus.validationFailure,
          name: Name(''),
          emailValidated: true,
          passwordValidated: true,
          nameValidated: false),
    },
  );
}
