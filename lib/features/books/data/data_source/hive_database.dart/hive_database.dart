import 'package:hive/hive.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

class BooksDatabase {
  final box = Hive.openBox('notes');
  Future<void> saveBookLocal(BooksModel book) async {
    try {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(BookEntityAdapter());
      }
      final box = await Hive.openBox<BooksModel>('books_box');
      await box.put(book.title, book);
    } catch (e) {
      return;
    }
  }

  Future<void> deleteBookLocal(BooksModel book) async {
    try {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(BookEntityAdapter());
      }
      final box = await Hive.openBox<BooksModel>('notes_box');
      await box.delete(book.title);
    } catch (e) {
      return;
    }
  }

  Future<List<BooksModel>> getBooksLocal() async {
    try {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(BookEntityAdapter());
      }

      final box = await Hive.openBox<BookEntity>('notes_box');
      List<BooksModel> notes = [];
      notes.addAll(box.values as List<BooksModel>);

      return notes;
    } catch (e) {
      return [];
    }
  }

  Future<void> updateBookLocal(BooksModel book) async {
    try {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(BookEntityAdapter());
      }
      final box = await Hive.openBox<BooksModel>('notes_box');
      if (box.isEmpty) {
        return;
      }
      await box.put(book.title, book);
    } catch (e) {
      return;
    }
  }
}
