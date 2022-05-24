import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState.initial());

  void searchKeyChanged(String value) {
    emit(state.copyWith(searchKey: value, status: ExploreStatus.typing));
  }

  Future<void> submitSearch() async {
    if (state.status == ExploreStatus.submitting) {
      return;
    } //to avoid sending multiple reqs at the same time
    emit(state.copyWith(status: ExploreStatus.submitting));
    try {
      // TODO IMPLEMENT SEARCH-QUERY REPO
      // await _authRepository.logInWithEmailAndPassword(
      //     searchKey: state.searchKey);
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: ExploreStatus.success));
    } catch (_) {}
  }
}
