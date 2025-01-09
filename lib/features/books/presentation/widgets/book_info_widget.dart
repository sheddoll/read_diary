import 'package:flutter/material.dart';
import 'package:read_diary/core/consts.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

class BookInfo extends StatelessWidget {
  final BookEntity? bookEntity;
  const BookInfo({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          bookEntity?.imageLinks?['thumbnail'] ?? defaultCover,
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
        ),
        Expanded(
          child: ListView(padding: const EdgeInsets.all(16.0), children: [
            if (bookEntity?.title != null)
              Text('Название: ${bookEntity?.title}'),
            if (bookEntity?.authors != null)
            Text('Авторы: ${bookEntity!.authors.toString()}'),
            if (bookEntity?.description != null)
            Text('Описание: ${bookEntity!.description}'),
            if (bookEntity?.categories != null)
            Text('Жанр: ${bookEntity!.categories.toString()}'),
            if (bookEntity?.publishedDate != null)
            Text('Дата публикации: ${bookEntity!.publishedDate}'),
            if (bookEntity?.pageCount != null)
            Text('Количество страниц: ${bookEntity!.pageCount.toString()}'),
            if (bookEntity?.publisher != null)
            Text('Опубликовано: ${bookEntity!.publisher}'),
          ]),
        ),
      ],
    );
  }
}
