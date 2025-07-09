import 'package:flutter/widgets.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/article_respone.dart';

class NewsViewModel with ChangeNotifier {
  bool isLoading = false;
  NewsDataSource sourcesDataSource = NewsDataSource();
  List<Articles>article = [];
  String? errorMessage;

  Future<void> getSources(String sourceId) async {
    isLoading = true;
    try {
      ArticleRespone response = await sourcesDataSource.getArticle(sourceId);
      if (response.status == "ok" && response.articles != null) {
        article = response.articles!;
      } else {
        errorMessage = "Something went wrong";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}