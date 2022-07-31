import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/routes/login/login.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';
import '../../../shared_mocks.mocks.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {

  late AuthenticationRepository mockAuthenticationRepository;
  const tEmail = 'hello@upcarta.com';
  const tPassword = '12345678';
  const tUser = User(email: 'hello@upcarta.com');
  const tToken =
      'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzcG90YWJsZSIsImV4cCI6MTY1OTc3NTUyMiwiaWF0IjoxNjU3MzU2MzIyLCJpc3MiOiJzcG90YWJsZSIsImp0aSI6ImRhNWI1ZjQ4LWZiNzAtNDE3Mi1iYzY1LWM4YWYzNzAwNDgzNiIsIm5iZiI6MTY1NzM1NjMyMSwic3ViIjoiMSIsInR5cCI6ImFjY2VzcyJ9.yYEFOUcEjP34cbkmDy88-wKUF-2VbVO0phn7Vc3vKUtANO329rFdb5nuPvwi1ixBOn30AqZ4tZ71iKAoQTVkPQ';

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
  });


  group('LoginCubit', (){
    test('initial state is initial', (){
      final login_cubit = LoginCubit(
        mockAuthenticationRepository
      );
      expect(login_cubit.state, LoginState(email: EmailAddress(''), password: Password(''), status: LoginStatus.initial, emailValidated: false, passwordValidated: false));
    });

    group('Login submitted', () {
      blocTest<LoginCubit, LoginState>(
        'emits [submitting, success] when login succeeds',
        setUp: (){
          when(mockAuthenticationRepository.authenticate(tEmail, tPassword),)
              .thenAnswer( (_) async => const Right(tUser) );
        },
        build: () => LoginCubit(
          mockAuthenticationRepository
        ),
        expect: () => <LoginState>[LoginState(email: EmailAddress(''), password: Password(''), status: LoginStatus.submitting, emailValidated: false, passwordValidated: false),
          LoginState(email: EmailAddress(''), password: Password(''), status: LoginStatus.success, emailValidated: false, passwordValidated: false), ]
      );

      blocTest<LoginCubit, LoginState>(
          'emits [submitting, submissionFailure] when login fails',
          setUp: (){
            when(mockAuthenticationRepository.authenticate(tEmail, tPassword),)
                .thenAnswer( (_) async => Left(ServerFailure()) );
          },
          build: () => LoginCubit(
              mockAuthenticationRepository
          ),
          expect: () => <LoginState>[LoginState(email: EmailAddress(''), password: Password(''), status: LoginStatus.submitting, emailValidated: false, passwordValidated: false),
            LoginState(email: EmailAddress(''), password: Password(''), status: LoginStatus.submissionFailure, emailValidated: false, passwordValidated: false), ]
      );
    });
  });
  ///TODO: VALIDATION TESTS

}
