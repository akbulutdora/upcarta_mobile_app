import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/user.dart';
import 'package:upcarta_mobile_app/repositories/query_repository.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'other_profile_event.dart';
part 'other_profile_state.dart';

class OtherProfileBloc extends Bloc<OtherProfileEvent, OtherProfileState> {
  late final StreamSubscription<AppUser>? _userSubscription;
  final UserRepository _userRepository;
  final QueryRepository _queryRepository;
  final String _userID;

  OtherProfileBloc({
    required UserRepository userRepository,
    required QueryRepository queryRepository,
    required String userID,
  })  : _userRepository = userRepository,
        _queryRepository = queryRepository,
        _userID = userID,
        super(const OtherProfileState.initial(AppUser.empty)) {
    on<OtherProfileEventChanged>(_onChanged);
    on<OtherProfileEventFetched>(_onUserFetched);
    // _userSubscription =
    //     _userRepository.user.listen((user) => add(OtherProfileEventChanged(
    //           user,
    //         )));
  }

  Future _onUserFetched(
      OtherProfileEventFetched event, Emitter<OtherProfileState> emit) async {
    try {
      if (state.status == OtherProfileStatus.initial) {
        emit(const OtherProfileState.loading());
        final AppUser thisUser = await _queryRepository.fetchUser(event.uid);
        emit(OtherProfileState.success(thisUser));
      }
    } catch (e) {
      print(e);
      emit(const OtherProfileState.failure());
    }
  }

  FutureOr<void> _onChanged(
      OtherProfileEventChanged event, Emitter<OtherProfileState> emit) async {
    emit(const OtherProfileState.loading());

    emit(event.user.isNotEmpty
        ? OtherProfileState.success(event.user)
        : const OtherProfileState.failure());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
