
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/data/models/books.dart';

abstract class BooksRepository{
  //API
  Future<DataState> getBooksRemote(bookName);
  //Hive
  Future<void> saveBookLocal(BooksModel book);
  Future<void> deleteBookLocal(BooksModel book);
  Future<List<BooksModel>> getBooksLocal();
  Future<void> editBookLocal(BooksModel book);
}