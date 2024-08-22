import '../../domain/entity/books.dart';

class BooksModel extends BooksEntity {
  const BooksModel({
    String ? title,
    List<String> ? authors,
    String ? publisher,
    String ? publishedDate,
    String ? description,
    int ? pageCount,
    List<String> ? categories,
    Map<String,String> ? imageLinks,
  }): super(
    title: title,
    authors: authors,
    publisher: publisher,
    publishedDate: publishedDate,
    description: description,
    pageCount: pageCount,
    categories: categories,
    imageLinks: imageLinks,
  );

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

  factory BooksModel.fromEntity(BooksEntity entity) {
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