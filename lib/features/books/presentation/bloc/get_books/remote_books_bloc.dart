import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/domain/usecases/get_books_info.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_event.dart';
import 'package:read_diary/features/books/presentation/bloc/get_books/remote_books_state.dart';

class RemoteBooksBloc extends Bloc<RemoteBooksEvent,RemoteBooksState>{

  final GetBooksInfoUseCase _getBooksInfoUseCase;
  RemoteBooksBloc(this._getBooksInfoUseCase): super(const RemoteBooksLoading()){
    on <GetBooks> (onGetBooks);
  }


  void onGetBooks(GetBooks event, Emitter <RemoteBooksState> emit) async{
    final dataState = await _getBooksInfoUseCase();
    debugPrint('Я принт из блока'+dataState.data.toString());
    debugPrint('Я принт из блока'+dataState.exception.toString());
     if(dataState is DataSuccess){
       emit(
           RemoteBooksDone(dataState.data)
       );
     }
     if(dataState is DataFailed){
       debugPrint('${dataState.exception}');
       emit(
           RemoteBooksError(dataState.exception!)

       );
     }

  }
}