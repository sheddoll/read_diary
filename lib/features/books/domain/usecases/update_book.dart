import 'package:read_diary/config/usecases.dart';
import 'package:read_diary/features/books/data/models/books.dart';
import 'package:read_diary/features/books/domain/entity/books.dart';
import 'package:read_diary/features/books/domain/repository/books_repository.dart';

class UpdateBookUseCase implements UseCase{
  final BooksRepository _booksRepository;

  UpdateBookUseCase(this._booksRepository);


  @override
  Future<void> call({dynamic params}){
    final BookEntity entity = params as BookEntity;
    final BooksModel book = BooksModel.fromEntity(entity);
    return _booksRepository.editBookLocal(book);
  }
}