import 'package:flutter/material.dart';
import 'package:read_diary/core/consts.dart';

Positioned buildButtonsWidget(BuildContext context) {
  return Positioned(
    left: 20,
    right: 20,
    bottom: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {Navigator.pushReplacementNamed(context,'/homePage');},
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
        defaultCover, // Ваше изображение
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height/3,
      ),



      /*this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.categories,*/
      Expanded(
        child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              Text('Название: Нападение Шкибиди Толчков'),
              SizedBox(height: 8.0),
              Text('Авторы: Стяковский Ш.Т.'),
              SizedBox(height: 8.0),
              Text('Описание: Удивительная история о том как бравые камермены охраняли наш мир от шкибиди толчков...'),
              SizedBox(height: 8.0),
              Text('Жанр: Хоррор'),
              SizedBox(height: 8.0),
              Text('Дата публикации: 27.11.2023'),
              SizedBox(height: 8.0),
              Text('Количество страниц: 400'),
              SizedBox(height: 8.0),
              Text('Опубликовано: Махаон'),

            ]
        ),
      ),
    ],
  );
}