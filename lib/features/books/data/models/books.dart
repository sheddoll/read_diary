import '../../domain/entity/books.dart';

class BooksModel extends BookEntity {
  const BooksModel({
    super.title,
    super.authors,
    super.publisher,
    super.publishedDate,
    super.description,
    super.pageCount,
    super.categories,
    super.imageLinks,
    super.userComments,
  });

  factory BooksModel.fromJson(Map < String, dynamic > map) {
    return BooksModel(
      title: map['title'] ?? "",
      authors: map['authors'] ?? "",
      publisher: map['publisher'] ?? "",
      publishedDate: map['publishedDate'] ?? "",
      description: map['description'] ?? "",
      pageCount: map['pageCount'] ?? "",
      categories: map['categories'] ?? "",
      imageLinks: map['imageLinks'] ?? "",
    );
  }

  factory BooksModel.fromEntity(BookEntity entity) {
    return BooksModel(
      title: entity.title,
      authors: entity.authors,
      publisher: entity.publisher,
      publishedDate: entity.publishedDate,
      description: entity.description,
      pageCount: entity.pageCount,
      categories: entity.categories,
      imageLinks: entity.imageLinks,
    );
  }
}