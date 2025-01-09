import 'package:hive_flutter/adapters.dart';
part 'books.g.dart';
@HiveType(typeId: 1)
class BookEntity{
  @HiveField(0)
  final String ? title;
  @HiveField(1)
  final List<dynamic> ? authors;
  @HiveField(2)
  final String ? publisher;
  @HiveField(3)
  final String ? publishedDate;
  @HiveField(4)
  final String ? description;
  @HiveField(5)
  final int ? pageCount;
  @HiveField(6)
  final List<dynamic> ? categories;
  @HiveField(7)
  final Map<dynamic,dynamic> ? imageLinks;
  @HiveField(8)
  final String ? userComments;

  const BookEntity({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.imageLinks,
    this.userComments,
  });

}