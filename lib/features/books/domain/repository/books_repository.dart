
import 'package:read_diary/core/resorces.dart';

abstract class BooksRepository{
  //API
  Future<DataState> getBooksInfo(bookName);
}