part of 'news_bloc.dart';

abstract class NewsEvents {

}
class StartEvent extends NewsEvents {}

class GetArticlesFromStorageEvent extends NewsEvents {

}

class GetArticlesFromRepoEvent extends NewsEvents {}

class NewsLoadedEvent extends NewsEvents {}