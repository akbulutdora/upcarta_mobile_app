import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_feed_event.dart';
part 'top_feed_state.dart';

class TopFeedBloc extends Bloc<TopFeedEvent, TopFeedState> {
  TopFeedBloc() : super(TopFeedInitial()) {
    on<TopFeedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
