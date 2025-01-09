import 'package:read_diary/config/usecases.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class SearchBooksUseCase implements UseCase{
  final BooksRepository _booksRepository;

  SearchBooksUseCase(this._booksRepository);


  @override
  Future<DataState> call({params}){
    return _booksRepository.getBooksRemote(params);
  }
}