class BooksEntity{
  final String ? title;
  final List<String> ? authors;
  final String ? publisher;
  final String ? publishedDate;
  final String ? description;
  final int ? pageCount;
  final List<String> ? categories;
  final Map<String,String> ? imageLinks;

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