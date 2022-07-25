import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';

import 'package:upcarta_mobile_app/routes/login/view/login_form_view.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late MockAuthRepo mockAuthRepo;
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });
  blocTest<LoginCubit, LoginState>(
    'enter first char email',
    build: () => LoginCubit(MockAuthRepo()),
    seed: () => LoginState(
        email: EmailAddress(''),
        password: Password(''),
        status: LoginStatus.initial,
        emailValidated: false,
        passwordValidated: false),
    act: (cubit) => cubit.emailChanged('a'),
    expect: () => {
      LoginState(
          email: EmailAddress('a'),
          password: Password(''),
          status: LoginStatus.validationFailure,
          emailValidated: false,
          passwordValidated: false)
    },
  );

  ///FIXME: because validations lag behind by 1 char, expect also lags
  blocTest<LoginCubit, LoginState>(
    'full email',
    build: () => LoginCubit(MockAuthRepo()),
    seed: () => LoginState(
        email: EmailAddress('ege@g.c'),
        password: Password(''),
        status: LoginStatus.validationFailure,
        emailValidated: false,
        passwordValidated: false),
    act: (cubit) => cubit.emailChanged('ege@g.ca'),
    expect: () => {
      LoginState(
          email: EmailAddress('ege@g.ca'),
          password: Password(''),
          status: LoginStatus.validationFailure,
          emailValidated: true,
          passwordValidated: false)
    },
  );
  blocTest<LoginCubit, LoginState>(
    'full email & pass',
    build: () => LoginCubit(MockAuthRepo()),
    seed: () => LoginState(
        email: EmailAddress('ege@g.c'),
        password: Password('12341234'),
        status: LoginStatus.validationFailure,
        emailValidated: false,
        passwordValidated: false),
    act: (cubit) => cubit.emailChanged('ege@g.ca'),
    expect: () => {
      LoginState(
          email: EmailAddress('ege@g.ca'),
          password: Password('12341234'),
          status: LoginStatus.validationSuccess,
          emailValidated: true,
          passwordValidated: true)
    },
  );
  blocTest<LoginCubit, LoginState>(
    'delete email char',
    build: () => LoginCubit(MockAuthRepo()),
    seed: () => LoginState(
        email: EmailAddress('ege@g.c'),
        password: Password('12341234'),
        status: LoginStatus.validationSuccess,
        emailValidated: true,
        passwordValidated: true),
    act: (cubit) => cubit.emailChanged('ege@g'),
    expect: () => {
      LoginState(
          email: EmailAddress('ege@g'),
          password: Password('12341234'),
          status: LoginStatus.validationFailure,
          emailValidated: false,
          passwordValidated: true)
    },
  );
}
