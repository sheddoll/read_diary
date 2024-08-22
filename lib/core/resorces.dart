import 'package:dio/dio.dart';

abstract class DataState<T>{
  final T? data;
  final DioException? exception;
  const DataState({this.data,this.exception});
}

class DataSuccess<T> extends DataState{
  const DataSuccess(T data):super(data: data);
}

class DataFailed<T> extends DataState{
  const DataFailed(DioException exception):super(exception: exception);
}