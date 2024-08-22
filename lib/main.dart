import 'package:flutter/material.dart';
import 'package:read_diary/features/books/data/data_source/books_google_api_service.dart';
import 'package:read_diary/read_diary.dart';

void main() {

  runApp(const MyApp());
  BooksApi().getBooks('Гарри-поттер');
}


