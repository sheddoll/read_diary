import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_event.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_state.dart';
import 'package:read_diary/features/books/presentation/widgets/founded_book_widget.dart';
import 'package:read_diary/features/books/presentation/widgets/get_book_app_bar.dart';

class GetBookPage extends StatelessWidget {
  const GetBookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size(double.maxFinite, MediaQuery.of(context).size.height / 15),
          child: const GetBookAppBar()),
      body: BlocBuilder<RemoteBooksBloc, RemoteBooksState>(
        builder: (_, state) {
          if (state is RemoteBooksStart) {
            return const Center(
              child: Opacity(
                opacity: 0.5,
                child: Row(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Введите название книги'),
                    Icon(Icons.search),
                  ],
                ),
              ),
            );
          }
          if (state is RemoteBooksLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is RemoteBooksError) {
            return const Center(
              child: Opacity(
                opacity: 0.5,
                child: Row(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Книги не найдены'),
                    Icon(Icons.refresh),
                  ],
                ),
              ),
            );
          }
          if (state is RemoteBooksDone) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: MediaQuery.of(context).size.height / 5,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              itemCount: state.books?.length,
              itemBuilder: (BuildContext context, int index) {
                return FoundedBook(bookEntity: state.books![index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'addButton',
        child: IconButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Color.fromRGBO(30, 0, 93, 1),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homePage');
            context.read<RemoteBooksBloc>().add(const AwaitGetBooks());
          },
          icon: const Icon(
            Icons.close,
            size: 36,
            color: Color.fromRGBO(179, 38, 30, 1),
          ),
        ),
      ),
    );
  }
}
