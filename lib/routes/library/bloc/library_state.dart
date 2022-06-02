part of 'library_bloc.dart';

enum LibraryStatus { initial, loading, success, failure, savesFetched }

class LibraryState extends Equatable {
  const LibraryState(
      {this.status = LibraryStatus.initial, this.contents = const <Content>[]});

  final LibraryStatus status;
  final List<Content> contents;

  LibraryState copyWith({
    LibraryStatus? status,
    List<Content>? contents,
  }) {
    return LibraryState(
      status: status ?? this.status,
      contents: contents ?? this.contents,
    );
  }

  @override
  List<Object> get props => [status, contents];
}

class LibraryInitial extends LibraryState {}
