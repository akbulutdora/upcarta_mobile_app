part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

class LibraryEventContentFetched extends LibraryEvent {}

class LibraryEventContentRefreshed extends LibraryEvent {}
