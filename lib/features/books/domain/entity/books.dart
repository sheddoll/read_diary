class BooksEntity{
  final String ? title;
  final List<dynamic> ? authors;
  final String ? publisher;
  final String ? publishedDate;
  final String ? description;
  final int ? pageCount;
  final List<dynamic> ? categories;
  final Map<dynamic,dynamic> ? imageLinks;

  const BooksEntity({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.imageLinks,
  });

}