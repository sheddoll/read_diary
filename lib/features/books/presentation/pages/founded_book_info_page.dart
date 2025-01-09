import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/presentation/widgets/book_info_buttons_widget.dart';
import 'package:read_diary/features/books/presentation/widgets/book_info_widget.dart';

class GetBookInfoPage extends StatelessWidget {
  final BookEntity bookEntity;
  const GetBookInfoPage({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
      BookInfo(bookEntity: bookEntity,),
      const BookInfoButtons(),
    ]));
  }
}
