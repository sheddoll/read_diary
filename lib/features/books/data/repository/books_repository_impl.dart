import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/data/data_source/remote/books_google_api_service.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository{
  final BooksApi _booksAPI;
  BooksRepositoryImpl(this._booksAPI);
  @override
  Future<DataState> getBooksInfo(bookName) async{
      try {
        final httpResponse = await _booksAPI.getBooks(bookName);
        debugPrint('Я принт из репозитория'+httpResponse.data.toString());
        debugPrint('Я принт из репозитория'+httpResponse.exception.toString());
        if (httpResponse.data != null) {
          return DataSuccess(httpResponse.data);
        }
        else {
          return DataFailed(DioException(requestOptions: httpResponse.exception!.requestOptions));
        }
      } on DioException catch(exception){
        return DataFailed(exception);

      }
  }
}