import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/presentation/pages/home_page.dart';
import 'package:read_diary/features/books/presentation/pages/book_info_page.dart';
import 'package:read_diary/features/books/presentation/pages/search_book_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/homePage':
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case '/getBookPage':
        return CupertinoPageRoute(builder: (context) => const GetBookPage());
      case '/bookInfoPage':
        final bookEntity = settings.arguments as BookEntity;
        return MaterialPageRoute(
          builder: (context) => BookInfoPage(book: bookEntity),
        );
      default:
        return CupertinoPageRoute(builder: (context) => const HomePage());
    }
  }
}
