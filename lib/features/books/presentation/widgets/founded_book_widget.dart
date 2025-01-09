import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

class FoundedBook extends StatelessWidget {
  final BookEntity bookEntity;
  const FoundedBook({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/bookInfoPage', arguments: bookEntity);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(bookEntity.imageLinks!['thumbnail'])),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                )
              ]),
        ));
  }
}
