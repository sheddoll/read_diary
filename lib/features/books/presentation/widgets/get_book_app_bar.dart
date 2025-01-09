import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_event.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_state.dart';

class GetBookAppBar extends StatelessWidget {
  const GetBookAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: BlocBuilder<RemoteBooksBloc, RemoteBooksState>(
        builder: (context, state) {
      return TextField(
        decoration: const InputDecoration(
          hintText: 'Введите название',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color(0xFFEAE6EF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              borderSide: BorderSide(
                color: Color.fromRGBO(29, 27, 32, 1),
              )),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              borderSide: BorderSide.none),
        ),
        style: const TextStyle(fontSize: 18.0, decoration: TextDecoration.none),
        onSubmitted: (value) {
          context.read<RemoteBooksBloc>().add(GetBooks(value));
        },
      );
    }));
  }
}
