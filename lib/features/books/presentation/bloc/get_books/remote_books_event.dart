abstract class RemoteBooksEvent {
  const RemoteBooksEvent();
}

class GetBooks extends RemoteBooksEvent {
  String bookName;
  GetBooks(this.bookName);
}

class AwaitGetBooks extends RemoteBooksEvent{
  const AwaitGetBooks();
}