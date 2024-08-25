import 'package:dio/dio.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

abstract class RemoteBooksState {
  final List<BooksEntity> ? books;
  final DioException ? exception;

  RemoteBooksState({this.books,this.exception});

  List<Object> get props => [books!, exception!];

}

class RemoteBooksLoading extends RemoteBooksState {
   RemoteBooksLoading();
}

class RemoteBooksDone extends RemoteBooksState {
   RemoteBooksDone(List<BooksEntity> books) : super(books: books);
}

class RemoteBooksError extends RemoteBooksState {
   RemoteBooksError(DioException exception) : super(exception: exception);
}

class RemoteBooksStart extends RemoteBooksState{
   RemoteBooksStart();
}