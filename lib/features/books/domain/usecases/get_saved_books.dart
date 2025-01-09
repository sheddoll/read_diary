import 'package:read_diary/config/usecases.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class GetSavedBooksUseCase implements UseCase{
  final BooksRepository _booksRepository;

  GetSavedBooksUseCase(this._booksRepository);


  @override
  Future<List<BookEntity>> call({void params}){
    return _booksRepository.getBooksLocal();
  }
}