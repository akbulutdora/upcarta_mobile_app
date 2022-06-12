import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/models/content.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'new_action_state.dart';

class NewActionCubit extends Cubit<NewActionState> {
  NewActionCubit(this._userRepository) : super(NewActionState.initial());
  final UserRepository _userRepository;

  void contentChanged(String value) {
    emit(state.copyWith(postContent: value, status: ActionStatus.initial));
  }

  void titleChanged(String value) {
    emit(state.copyWith(postTitle: value, status: ActionStatus.initial));
  }
  void urlChanged(String value) {
    emit(state.copyWith(postUrl: value, status: ActionStatus.initial));
  }

  Future<void> submitContent() async {
    if (state.status == ActionStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: ActionStatus.submitting));
    try {
      await _userRepository.createContent(state.contentTtile, state.contentURL, state.content);
      emit(state.copyWith(status: ActionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: ActionStatus.submissionFailure));
    }
  }
}
