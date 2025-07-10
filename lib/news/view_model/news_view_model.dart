import 'package:flutter/widgets.dart';
import 'package:news/news/data/data_source/news_api_data_source.dart';
import 'package:news/news/data/models/article_respone.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/shared/services_locator.dart';

class NewsViewModel with ChangeNotifier {
  bool isLoading = false;
late  NewsRepository repository;
NewsViewModel(){
  repository=NewsRepository(dataSource: ServicesLocator.newsDataSource);
}

  List<Articles>article = [];
  String? errorMessage;

  Future<void> getSources(String sourceId) async {
    isLoading = true;
    try {
      article= await repository.getArticle(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}