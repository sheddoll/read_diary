import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_diary/core/consts.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/data/models/books.dart';
class BooksApi {
  Future<DataState> getBooks(String bookName) async {
    final response = await Dio().get('$booksAPI$bookName&maxResults=30');
    try {
      final _items = response.data["items"] as List<dynamic>?;

      if (_items == null || _items.isEmpty) {
        debugPrint('Список _items пуст или равен null');
        return DataFailed(DioException(requestOptions: response.requestOptions));
      }

      debugPrint('Я принт из АПИ: ' + _items.toString());

      // Создаем пустой список для книг
      List<BooksModel> books = [];

      // Проходим по каждому элементу в _items
      for (var item in _items) {
        try {
          // Извлекаем информацию о книге из поля volumeInfo
          final info = item['volumeInfo'] as Map<String, dynamic>?;

          if (info == null) {
            debugPrint('volumeInfo is null for item: $item');
            continue; // Пропускаем этот элемент и переходим к следующему
          }

          // Создаем объект BooksModel и добавляем его в список books
          books.add(BooksModel(
            title: info['title'] ?? 'Unknown Title',
            authors: info['authors'] ?? [],
            publisher: info['publisher'] ?? 'Unknown Publisher',
            publishedDate: info['publishedDate'] ?? 'Unknown Date',
            description: info['description'] ?? 'No Description',
            pageCount: info['pageCount'] ?? 0,
            categories: info['categories'] ?? [],
            imageLinks: info['imageLinks'] ?? defaultCover,
          ));

          debugPrint('Добавлена книга: ' + info['title'].toString());
        } catch (e) {
          debugPrint('Ошибка при парсинге элемента: $e');
        }
      }

      if (books.isEmpty) {
        debugPrint('Список books пуст');
        return DataFailed(DioException(requestOptions: response.requestOptions));
      }

      debugPrint('Я принт из АПИ (Только книги): ' + books.toString());

      // Возвращаем успешный результат с списком книг
      return DataSuccess(books);
    } catch (e) {
      debugPrint('Ошибка: $e');
      // В случае ошибки возвращаем DataFailed
      return DataFailed(DioException(requestOptions: response.requestOptions));
    }
  }
}