class ArticleModel {
  String? title;
  String? description;
  String? urlToImage;
  String? author;
  String? content;
  ArticleModel(
      {this.title,
      this.description,
      this.urlToImage,
      this.author,
      this.content});
  factory ArticleModel.formJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
      author: json["author"],
      content: json["content"],
    );
  }
}
