import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/models.dart';
import 'package:upcarta_mobile_app/repositories/user_repository.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final UserRepository userRepository;
  LibraryBloc({required this.userRepository}) : super(LibraryInitial()) {
    on<LibraryEventContentFetched>(_onContentFetched);
    // on<LibraryEventContentRefreshed>();
  }

  Future<void> _onContentFetched(
      LibraryEventContentFetched event, Emitter<LibraryState> emit) async {
    if (state.status == LibraryStatus.loading) return;
    try {
      emit(state.copyWith(
        status: LibraryStatus.loading,
      ));

      final contents = await userRepository.libraryGetSaves();
      if (kDebugMode) {
        print('AAAAAA:\n\n$contents');
      }
      List<Content> emptyList = [];
      return emit(state.copyWith(
        status: LibraryStatus.success,
        contents: contents ?? emptyList,
      ));
    } catch (_) {
      emit(state.copyWith(status: LibraryStatus.failure));
    }
  }
}
