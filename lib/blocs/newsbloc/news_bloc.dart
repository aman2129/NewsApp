import 'package:grevity/models/article_model.dart';
import 'package:grevity/services/news_services_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grevity/storage/hive_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'news_events.dart';

part 'news_states.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final NewsApiServices newsApiServices;

  NewsBloc(this.newsApiServices)
      : super(NewsInitState()) {
    on<GetArticlesFromStorageEvent>(
          (event, emit) async {
        emit(NewsLoadingState());
        try {
          final box = await Hive.openBox<ArticleModel>(HiveStorage.boxName);
          List<ArticleModel> articleList;
          if (box.isNotEmpty) {
            articleList = box.values.toList();
            emit( NewsLoadedState(articleList: articleList));
          } else if (box.isEmpty) {
            emit (NewsErrorState(
                errorMessage: 'Check Your Connection'));
          }
        } catch (e) {
          emit (NewsErrorState(errorMessage: e.toString()));
        }
      },
    );

    on<GetArticlesFromRepoEvent>(
          (event, emit) async {
        emit(NewsLoadingState());
        try {
          var hive = HiveStorage();
          final box = await Hive.openBox<ArticleModel>(HiveStorage.boxName);
          List<ArticleModel> articleList = [];
          emit (NewsLoadingState());
          articleList = await newsApiServices.fetchNews();
          box.clear();
          hive.addDataToHive(articleList);
          emit (NewsLoadedState(articleList: articleList));
        } catch (e) {
          emit(NewsErrorState(errorMessage: e.toString()));
        }
      },
    );
  }



}
