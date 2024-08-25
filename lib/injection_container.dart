import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:read_diary/features/books/data/data_source/remote/books_google_api_service.dart';
import 'package:read_diary/features/books/data/repository/books_repository_impl.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';
import 'package:read_diary/features/books/domain/usecases/get_books_info.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  //DIO
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<BooksApi>(BooksApi());

  sl.registerSingleton<BooksRepository>(
    BooksRepositoryImpl(sl())
  );
  //UseCases
  sl.registerSingleton<GetBooksInfoUseCase>(
    GetBooksInfoUseCase(sl())
  );
  
  //BLoC
  sl.registerFactory<RemoteBooksBloc>(
      ()=> RemoteBooksBloc(sl(),)
  );

}