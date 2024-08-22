import 'package:read_diary/features/books/data/data_source/books_google_api_service.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

abstract class BooksRepositoryImpl implements BooksRepository{
  final BooksApi _booksAPI;
  BooksRepositoryImpl(this._booksAPI);
  @override
  Future<List<BooksModel>> getBooksInfo(bookName) async{
      final httpResponse = await _booksAPI.getBooks(bookName);
      return httpResponse;
  }
}