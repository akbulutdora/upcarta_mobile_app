import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:upcarta_mobile_app/core/services/input_validation_service.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';
import 'package:upcarta_mobile_app/routes/onboarding/cubit/onboarding_cubit.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';

class MockUserRepo extends Mock implements UserRepository {}

void main() {
  late MockUserRepo mockUserRepo;
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    mockUserRepo = MockUserRepo();
  });
  blocTest<OnboardingCubit, OnboardingState>(
    'uname unval->val',
    build: () => OnboardingCubit(mockUserRepo),
    seed: () => OnboardingState(
        bio: '',
        status: OnboardingStatus.validationFailure,
        photoURL: '',
        id: '1',
        username: Username(''),
        usernameValidated: false),
    act: (cubit) => cubit.usernameChanged('a'),
    expect: () => {
      OnboardingState(
          bio: '',
          status: OnboardingStatus.validationSuccess,
          photoURL: '',
          id: '1',
          username: Username('a'),
          usernameValidated: true)
    },
  );
  blocTest<OnboardingCubit, OnboardingState>(
    'uname val->unval',
    build: () => OnboardingCubit(mockUserRepo),
    seed: () => OnboardingState(
        bio: '',
        status: OnboardingStatus.validationSuccess,
        photoURL: '',
        id: '1',
        username: Username('a'),
        usernameValidated: true),
    act: (cubit) => cubit.usernameChanged(''),
    expect: () => {
      OnboardingState(
          bio: '',
          status: OnboardingStatus.validationFailure,
          photoURL: '',
          id: '1',
          username: Username(''),
          usernameValidated: false)
    },
  );
}
