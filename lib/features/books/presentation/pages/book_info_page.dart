import 'package:flutter/material.dart';
import 'package:read_diary/features/books/presentation/widgets/book_info_widgets.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildInfoWidget(context),
          buildButtonsWidget(context),
        ]
      )
    );
  }
}

