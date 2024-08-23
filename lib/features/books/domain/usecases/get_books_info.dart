import 'package:read_diary/config/usecases.dart';
import 'package:read_diary/core/resorces.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class GetBooksInfoUseCase implements UseCase{
  final BooksRepository _booksRepository;

  GetBooksInfoUseCase(this._booksRepository);

  get bookName => 'Гарри Поттер';

  @override
  Future<DataState> call({void params}){
    return _booksRepository.getBooksInfo(bookName);
  }
}