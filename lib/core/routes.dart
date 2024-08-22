import 'package:flutter/cupertino.dart';
import 'package:read_diary/features/books/presentation/pages/home_page.dart';
import 'package:read_diary/features/books/presentation/pages/book_info_page.dart';
import 'package:read_diary/features/books/presentation/pages/get_book_page.dart';

Map<String,WidgetBuilder> routes = {
  '/homePage' : (context) => HomePage(),
  '/getBookPage' : (context) => GetBookPage(),
  '/bookInfoPage' : (context) => BookInfoPage(),
};
