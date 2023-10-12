import 'article.dart';

class NewsResponse {
  String? status;
  String? message;
  String? code;
  int? totalResults;
  List<Article>? articles;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.message,
    this.code,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        message: json['message'] as String?,
        code: json['code'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
