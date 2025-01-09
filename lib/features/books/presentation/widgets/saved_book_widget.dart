import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

class SavedBook extends StatelessWidget {
  final bool deleteBook;
  final BookEntity bookEntity;
  const SavedBook(
      {super.key, required this.deleteBook, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          'bookInfoPage',
          arguments: bookEntity,
        );
      },
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              //image: DecorationImage(image: AssetImage('assetName')),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ]),
          child: Center(
            child: !deleteBook
                ? const SizedBox.shrink()
                : const AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(seconds: 1),
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 90,
                    ),
                  ),
          )),
    );
  }
}
