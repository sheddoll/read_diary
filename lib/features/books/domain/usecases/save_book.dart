import 'package:read_diary/config/usecases.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class SaveBookUseCase implements UseCase{
  final BooksRepository _booksRepository;

  SaveBookUseCase(this._booksRepository);


  @override
  Future<void> call({void params}){
    final BookEntity entity = params as BookEntity;
    final BooksModel book = BooksModel.fromEntity(entity);
    return _booksRepository.saveBookLocal(book);
  }
}