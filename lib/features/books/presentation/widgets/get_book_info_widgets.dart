import 'package:flutter/material.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';

class FoundedBookInfoWidgets {
  final BooksEntity ? booksEntity;

  const FoundedBookInfoWidgets({ this.booksEntity});

  Positioned buildButtonsWidget(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/homePage');
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF7B5EA5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(232, 222, 248, 1),
                size: 32,
              ),
            ),
          ),
          Hero(
            tag: 'addButton',
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF7B5EA5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(232, 222, 248, 1),
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildInfoWidget(BuildContext context) {
    return Column(
      children: [
        Image.network(
          booksEntity!.imageLinks!['thumbnail'],
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
        ),
        Expanded(
          child: ListView(
              padding: const EdgeInsets.all(16.0),
              children:  [
                Text('Название: ${booksEntity!.title}'),
                const SizedBox(height: 8.0),
                Text('Авторы: ${booksEntity!.authors.toString()}'),
                const SizedBox(height: 8.0),
                Text('Описание: ${booksEntity!.description}'),
                const SizedBox(height: 8.0),
                Text('Жанр: ${booksEntity!.categories.toString()}'),
                const SizedBox(height: 8.0),
                Text('Дата публикации: ${booksEntity!.publishedDate}'),
                const SizedBox(height: 8.0),
                Text('Количество страниц: ${booksEntity!.pageCount.toString()}'),
                const SizedBox(height: 8.0),
                Text('Опубликовано: ${booksEntity!.publisher}'),

              ]
          ),
        ),
      ],
    );
  }
}