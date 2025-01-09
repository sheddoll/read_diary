import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:read_diary/features/books/data/data_source/hive_database.dart/hive_database.dart';
import 'package:read_diary/features/books/data/data_source/remote/books_google_api_service.dart';
import 'package:read_diary/features/books/data/repository/books_repository_impl.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';
import 'package:read_diary/features/books/domain/usecases/delete_book.dart';
import 'package:read_diary/features/books/domain/usecases/get_saved_books.dart';
import 'package:read_diary/features/books/domain/usecases/save_book.dart';
import 'package:read_diary/features/books/domain/usecases/search_books.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';
import 'package:read_diary/features/books/presentation/bloc/home_bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  final localDatabase = BooksDatabase();
  final remoteDatabase = BooksApi();
  //DIO
  sl.registerSingleton<Dio>(Dio());

  //Hive
  sl.registerSingleton<BooksDatabase>(localDatabase);

  //API
  sl.registerSingleton<BooksApi>(remoteDatabase);

  //Repository
  sl.registerSingleton<BooksRepository>(
    BooksRepositoryImpl(sl(),sl())
  );

  //UseCases
  sl.registerSingleton<SearchBooksUseCase>(
    SearchBooksUseCase(sl())
  );
  sl.registerSingleton<EditBookUseCase>(
    EditBookUseCase()
  );
  sl.registerSingleton<DeleteBookUseCase>(
    DeleteBookUseCase(sl())
  );
  sl.registerSingleton<SaveBookUseCase>(
    SaveBookUseCase(sl())
  );
  sl.registerSingleton<GetSavedBooksUseCase>(
    GetSavedBooksUseCase(sl())
  );
  
  
  //BLoC
  sl.registerFactory<RemoteBooksBloc>(
      ()=> RemoteBooksBloc(sl())
  );
  sl.registerFactory<HomeBloc>(
      ()=> HomeBloc(sl(),sl(),sl(),sl())
  );

}