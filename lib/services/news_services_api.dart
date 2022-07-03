import 'package:dio/dio.dart';
import 'package:grevity/models/article_model.dart';
import '../models/article_model.dart';

const apiKey = "dac15bf24b574c5f9853f6e5b3dce741";

class NewsApiServices {
  final String _url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
  late Dio _dio;

  NewsApiServices() {
    _dio = Dio();
  }

  Future<List<ArticleModel>> fetchNews() async {
    List<ArticleModel> articleModelList = [];
    try {
      Response response = await _dio.get(_url);
      var data = response.data;
      if (response.statusCode == 200) {
        for (var item in data["articles"]) {
          ArticleModel articleModel = ArticleModel.fromJson(item);
          articleModelList.add(articleModel);
        }
        return articleModelList;
      } else {
        return articleModelList;
      }
    } on DioError {
      rethrow;
    }
  }
}