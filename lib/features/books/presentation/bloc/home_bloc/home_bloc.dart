import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/domain/usecases/delete_book.dart';
import 'package:read_diary/features/books/domain/usecases/get_saved_books.dart';
import 'package:read_diary/features/books/domain/usecases/save_book.dart';
import 'package:read_diary/features/books/domain/usecases/update_book.dart';
part 'package:read_diary/features/books/presentation/bloc/home_bloc/home_event.dart';
part 'package:read_diary/features/books/presentation/bloc/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSavedBooksUseCase _getSavedBooksUseCase;
  final DeleteBookUseCase _deleteBookUseCase;
  final SaveBookUseCase _saveBookUseCase;
  final UpdateBookUseCase _editBookUseCase;
  HomeBloc(this._getSavedBooksUseCase, this._deleteBookUseCase,
      this._saveBookUseCase, this._editBookUseCase)
      : super(HomeState()) {
    on<SaveBook>(_onSaveBook);
    on<EditBook>(_onEditBook);
    on<GetSavedBooks>(onGetSavedBooks);
    on<DeleteBook>(_onDeleteBook);
    on<ChangeDeleteMode>(_onChangeDeleteMode);
  }

  FutureOr<void> _onSaveBook(SaveBook event, Emitter<HomeState> emit) {}
  FutureOr<void> _onEditBook(EditBook event, Emitter<HomeState> emit) {
    _editBookUseCase.call(params: event.bookEntity);
    final BookEntity book = List.of(state.books).
        firstWhere((element) => element.title == event.bookEntity.title);
    final List<BookEntity> books = List.of(state.books);
  }

  FutureOr<void> onGetSavedBooks(
      GetSavedBooks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<BooksModel> books =
        await _getSavedBooksUseCase.call() as List<BooksModel>;
    emit(state.copyWith(books: books, isLoading: false));
  }

  FutureOr<void> _onDeleteBook(DeleteBook event, Emitter<HomeState> emit) {
    _deleteBookUseCase.call(params: event.bookEntity);
    final List<BookEntity> books = List.of(state.books
      ..removeWhere((element) => element.title == event.bookEntity.title));
    emit(state.copyWith(books: books));
  }

  FutureOr<void> _onChangeDeleteMode(
      ChangeDeleteMode event, Emitter<HomeState> emit) {
    emit(state.copyWith(isDelete: !state.isDelete));
  }
}
