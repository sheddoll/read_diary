import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_event.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'package:read_diary/injection_container.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteBooksBloc>(
      create: (context) => sl()..add(const AwaitGetBooks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routes: routes,
        initialRoute: '/homePage',

      ),
    );
  }
}