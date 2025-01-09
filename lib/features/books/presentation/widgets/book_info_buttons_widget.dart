import 'package:flutter/material.dart';

class BookInfoButtons extends StatelessWidget {
  const BookInfoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
}
