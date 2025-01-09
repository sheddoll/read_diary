part of 'home_bloc.dart';

class HomeState {
  final bool isLoading;
  final bool isDelete;
  final List<BookEntity> books;

  HomeState({
    this.isLoading = false,
    this.isDelete = false,
    this.books = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isDelete,
    List<BookEntity>? books,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isDelete: isDelete ?? this.isDelete,
      books: books ?? this.books,
    );
  }
}
