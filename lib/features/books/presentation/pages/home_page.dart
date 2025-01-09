import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:read_diary/features/books/presentation/widgets/home_page_appbar_widget.dart';
import 'package:read_diary/features/books/presentation/widgets/saved_book_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, MediaQuery.of(context).size.height / 15),
            child: HomePageAppBar(deleteBook: state.isDelete)),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: MediaQuery.of(context).size.height / 5,
            crossAxisSpacing: 30,
            mainAxisSpacing: 40,
          ),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          itemCount: state.books.length,
          itemBuilder: (BuildContext context, int index) {
            return SavedBook(bookEntity: state.books[index], deleteBook: state.isDelete);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Hero(
          tag: 'addButton',
          child: IconButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/getBookPage'),
            icon: const Icon(
              Icons.add,
              size: 36,
            ),
          ),
        ),
      );
    });
  }
}
