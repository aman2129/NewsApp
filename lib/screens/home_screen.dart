import 'package:grevity/blocs/newsbloc/news_bloc.dart';
import 'package:grevity/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grevity/userInterface/home_ui.dart';
import '../blocs/internetbloc/internet_bloc.dart';
import '../blocs/newsbloc/news_bloc.dart';
import '../models/article_model.dart';
import 'package:grevity/userInterface/animation.dart';



class HomeScreen extends StatelessWidget {
  final ArticleModel articleModel;

  const HomeScreen({required this.articleModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Headlines'.toUpperCase(),
            style: const TextStyle(
              letterSpacing: 5.0,
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: BlocConsumer<InternetBloc, InternetStates>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Connected',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.lightGreen,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'No Connection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Check Your Connection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, internetState) {
            if (internetState is InternetGainedState) {
              BlocProvider.of<NewsBloc>(context)
                  .add(GetArticlesFromRepoEvent());
            }
            if (internetState is InternetLostState ||
                internetState is InternetInitialState) {
              BlocProvider.of<NewsBloc>(context)
                  .add(GetArticlesFromStorageEvent());
            }
            return Container(
              color: Colors.black54,
              child: BlocBuilder<NewsBloc, NewsStates>(
                builder: (BuildContext context, NewsStates state) {
                  if (state is NewsLoadingState) {
                    return ListView.separated(
                      itemBuilder: (context, index) => const HomeAnimation(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: 3,
                    );
                  } else if (state is NewsLoadedState) {
                    List<ArticleModel> articleList = [];
                    articleList = state.articleList;
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: articleList.length,
                      itemBuilder: ((context, index) =>
                          HomeUi(articleModel: state.articleList[index])),
                    );
                  } else if (state is NewsErrorState) {
                    String error = state.errorMessage;

                    return Center(child: Text(error));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
