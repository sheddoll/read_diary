import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_event.dart';
import 'package:read_diary/features/books/presentation/bloc/home_bloc/home_bloc.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'package:read_diary/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteBooksBloc>(
            create: (context) => sl()..add(const AwaitGetBooks())),
        BlocProvider<HomeBloc>(create: (context) => sl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/homePage',
      ),
    );
  }
}
