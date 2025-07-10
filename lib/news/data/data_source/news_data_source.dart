import 'package:news/news/data/models/article_respone.dart';

abstract class NewsDataSource {
  Future<List<Articles>> getArticle(String sourceId);
}