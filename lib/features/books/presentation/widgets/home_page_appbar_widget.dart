import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/home_bloc/home_bloc.dart';

class HomePageAppBar extends StatelessWidget {
  final bool deleteBook;
  const HomePageAppBar({super.key, required this.deleteBook});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Booker'),
      leading: GestureDetector(
        onTap: () {},
        child: const SizedBox(
          width: 24,
          child: Icon(
            Icons.exit_to_app_outlined,
            size: 24,
          ),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(const ChangeDeleteMode());
            },
            child: Container(
              margin: const EdgeInsets.all(14),
              width: 24,
              child: Hero(
                tag: 'editIcon',
                child: !deleteBook
                    ? const Icon(
                        Icons.edit,
                        size: 24,
                      )
                    : const Icon(
                        Icons.close,
                        size: 24,
                      ),
              ),
            ))
      ],
    );
  }
}
