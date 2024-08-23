import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/presentation/widgets/get_book_info_widgets.dart';

class GetBookInfoPage extends StatelessWidget {
  final BooksEntity booksEntity;
  const GetBookInfoPage({super.key, required this.booksEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              FoundedBookInfoWidgets(booksEntity: booksEntity).buildInfoWidget(context),
              FoundedBookInfoWidgets(booksEntity: booksEntity).buildButtonsWidget(context),
            ]
        )
    );
  }
}