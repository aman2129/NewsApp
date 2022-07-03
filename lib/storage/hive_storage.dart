import 'package:grevity/models/article_model.dart';
import 'package:hive/hive.dart';


class HiveStorage {
  static const String boxName = 'articles';
  List<ArticleModel> _articleList = [];

  void getDataFromHive() async {
    final box = await Hive.openBox<ArticleModel>(boxName);
    _articleList = box.values.toList();
  }

  void addDataToHive(List<ArticleModel> articleList) async {
    final box = await Hive.openBox<ArticleModel>(boxName);
    for (var articles in articleList) {
      await box.add(articles);
    }
    _articleList = box.values.toList();
  }

  List<ArticleModel> get getarticles => _articleList;
  int get articlesCount => _articleList.length;
}