class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: (json['articles'] as List)
            .map((e) => Articles.fromJson(e))
            .toList(),
      );
}

class Articles {
  String? title;
  String? description;
  Articles({this.title, this.description});
  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        title: json['title'],
        description: json['description'],
      );
}
