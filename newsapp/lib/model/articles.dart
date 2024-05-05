class Article {
  final String title;
  final String? description;
  final String publishedAt;
  final String? image;

  Article(
      {required this.title,
      this.description,
      this.image,
      required this.publishedAt});
}
