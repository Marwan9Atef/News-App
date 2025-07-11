import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/models/article_respone.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/shared/services_locator.dart';


class NewsViewModel extends Cubit<NewsState> {

late  NewsRepository repository;
NewsViewModel():super(NewsInitialState()){
  repository=NewsRepository(dataSource: ServicesLocator.newsDataSource);
}

  List<Articles>article = [];
  String? errorMessage;

  Future<void> getSources(String sourceId) async {
    emit(GetNewsIsLoadingState());
    try {
      article= await repository.getArticle(sourceId);
      emit(GetNewsSuccessState(article: article));
    } catch (error) {
 emit(GetNewsErrorState(errorMesssage: error.toString()));
    }

  }
}