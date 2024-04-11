class NewsArticle {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? content;
  final String? publishedAt;
  final Map<String?, String?>? source;

  NewsArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.publishedAt,
    this.source,
  });
}
