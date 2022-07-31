import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/app/bloc/app_bloc.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/repositories/analytics_repository.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository/user_repository.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import '../../shared_mocks.mocks.dart';


class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}
class MockUserRepository extends Mock implements UserRepository{}
class MockSharedPreferences extends Mock implements SharedPreferences{}
class MockAnalyticsRepository extends Mock implements AnalyticsRepository{}

void main() {
  /*
  AuthenticationRepository mockAuthenticationRepository = AuthenticationRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataStorage: mockLocalDataStorage,
      networkInfo: mockNetworkInfo);
  */
  late AuthenticationRepository authRepository;
  late UserRepository userRepository;
  late SharedPreferences sharedPreferences;
  late AnalyticsRepository analyticsRepository;
  const user = User(
    email: 'hello@upcarta.com',
    role: Role.user,
    entity: Entity(
        id: 1,
        name: 'Hello',
        username: 'helloupcarta',
        hasUser: true,
        followersCount: 0,
        followedContentsCount: 0,
        followedEntitiesCount: 0,
        followedTopicsCount: 0),
    identities: [],
  );

  setUp(() {
    MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
    MockLocalDataStorage mockLocalDataStorage = MockLocalDataStorage();
    MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
    authRepository = MockAuthenticationRepository();

    when(authRepository.status)
        .thenAnswer((_) => const Stream<AuthenticationStatus>.empty());
    userRepository = MockUserRepository();
    sharedPreferences = MockSharedPreferences();
    analyticsRepository = MockAnalyticsRepository();

  });

  group( 'AppBloc', (){
    test( 'Initial state is uninitialized', (){
      final bloc = AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository);
      expect(bloc.state, const AppState.uninitialized());
      bloc.close();
    });

    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] when status is unauthenticated',
      setUp: () {
        when(authRepository.status).thenAnswer(
              (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      expect: () => const <AppState>[
        AppState.unauthenticated(),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits [authenticated] when status is authenticated',
      setUp: () {
        when(authRepository.status).thenAnswer(
              (_) => Stream.value(AuthenticationStatus.authenticated),
        );
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      expect: () => const <AppState>[
        AppState.authenticated(user),
      ],
    );
  });

  group('AuthenticationStatusChanged', () {
    blocTest<AppBloc, AppState>(
      'emits [authenticated] when status is authenticated',
      setUp: () {
        when(authRepository.status).thenAnswer(
              (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(userRepository.getUser()).thenAnswer((_) async => const Right(user));
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: () => const <AppState>[
        AppState.authenticated(user),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] when status is unauthenticated',
      setUp: () {
        when(authRepository.status).thenAnswer(
              (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unauthenticated),
      ),
      expect: () => const <AppState>[
        AppState.unauthenticated(),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] when status is authenticated but getUser fails',
      setUp: () {
        when(() => userRepository.getUser()).thenThrow(Exception('any'));
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: () => const <AppState>[
        AppState.unauthenticated(),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] when status is authenticated but getUser returns an exception',
      setUp: () {
        when(userRepository.getUser()).thenAnswer((_) async => Left(CacheException()));
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: () => const <AppState>[
        AppState.unauthenticated(),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits [uninitialized] when status is uninitialized',
      setUp: () {
        when(authRepository.status).thenAnswer(
              (_) => Stream.value(AuthenticationStatus.uninitialized),
        );
      },
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.uninitialized),
      ),
      expect: () => const <AppState>[
        AppState.uninitialized(),
      ],
    );
  });

  group('AuthenticationLogoutRequested', () {
    blocTest<AppBloc, AppState>(
      'calls logOut on authenticationRepository when AuthenticationLogoutRequested is added',
      build: () => AppBloc(authRepository: authRepository, analyticsRepository: analyticsRepository,
          sharedPrefs: sharedPreferences, userRepository: userRepository),
      act: (bloc) => bloc.add(AppLogoutRequested()),
      verify: (_) {
        verify(() => authRepository.logOut()).called(1);
      },
    );
  });
  
}
