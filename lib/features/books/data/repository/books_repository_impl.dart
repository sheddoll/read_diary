import 'package:dio/dio.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/data/data_source/hive_database.dart/hive_database.dart';
import 'package:read_diary/features/books/data/data_source/remote/books_google_api_service.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksApi _booksAPI;
  final BooksDatabase _booksDatabase;
  BooksRepositoryImpl(this._booksAPI, this._booksDatabase);
  @override
  Future<DataState> getBooksRemote(bookName) async {
    try {
      final httpResponse = await _booksAPI.getBooks(bookName);
      if (httpResponse.data != null) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.exception!.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<void> saveBookLocal(BooksModel book) async {
    await _booksDatabase.saveBookLocal(book);
  }

  @override
  Future<void> editBookLocal(BooksModel book) async {
    await _booksDatabase.updateBookLocal(book);
  }

  @override
  Future<void> deleteBookLocal(BooksModel book) async {
    await _booksDatabase.deleteBookLocal(book);
  }

  @override
  Future<List<BooksModel>> getBooksLocal() async {
    try {
      final List<BooksModel> books = await _booksDatabase.getBooksLocal();
      return books;
    } catch (e) {
      return [];
    }
  }
}
