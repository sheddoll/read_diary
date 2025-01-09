part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetSavedBooks extends HomeEvent {
  const GetSavedBooks();
}

class SaveBook extends HomeEvent {
  final BookEntity bookEntity;
  const SaveBook({required this.bookEntity});
}

class DeleteBook extends HomeEvent {
  final BookEntity bookEntity;
  const DeleteBook({required this.bookEntity});
}

class EditBook extends HomeEvent {
  final BookEntity bookEntity;
  const EditBook({required this.bookEntity});
}

class ChangeDeleteMode extends HomeEvent {
  const ChangeDeleteMode();
}
