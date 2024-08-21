import 'package:flutter/material.dart';
import 'package:read_diary/features/books/presentation/pages/home_page.dart';
import 'package:read_diary/features/books/presentation/pages/get_book_page.dart';
import 'package:read_diary/features/books/presentation/pages/book_info_page.dart';
import 'package:read_diary/core/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: GetBookPage(),
    );
  }
}
