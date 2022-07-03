import 'package:hive/hive.dart';

part 'article_model.g.dart';

@HiveType(typeId: 1)
class ArticleModel {
  @HiveField(2)
  String? source;
  @HiveField(3)
  String? author;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String? url;
  @HiveField(7)
  String? urlToImage;
  @HiveField(8)
  String? publishedAt;
  @HiveField(9)
  String? content;

  ArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? 'No Data Found!',
      description: json['description'] ?? 'No Data Found!',
      content: json['content'] ?? 'No Data Found!',
      urlToImage: json['urlToImage'] ??
          'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
      publishedAt: json['publishedAt'] ?? 'No Data Found!',
      source: json['source']['name'] ?? 'No Data Found!',
    );
  }
}



