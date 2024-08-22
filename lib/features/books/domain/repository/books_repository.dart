
import 'package:read_diary/features/books/domain/entity/books.dart';

abstract class BooksRepository{
  //API
  Future<List<BooksEntity>> getBooksInfo(bookName);
}