import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_diary/core/consts.dart';
import 'package:read_diary/features/books/data/models/books.dart';
class BooksApi {
  Future<List<BooksModel>> getBooks(String bookName) async {
    final response = await Dio().get('$booksAPI$bookName&maxResults=10');
    debugPrint(response.toString());
    final _items = response.data["items"] as List<dynamic>;
    List<BooksModel> books = [];
    for(int i=0;i<9;i++) {
      final _bookInfo = _items[i] as Map<String, dynamic>;
      debugPrint(_bookInfo.toString());
      books.add(_bookInfo['volumeInfo'].entries.map((e) =>
          BooksModel(
            title: e.value['title'],
            authors: e.value['authors'],
            publisher: e.value['publisher'],
            publishedDate: e.value['publishedDate'],
            description: e.value['description'],
            pageCount: e.value['pageCount'],
            categories: e.value['categories'],
            imageLinks: e.value['imageLinks'],
          )));
    }
    return books;
  }
}