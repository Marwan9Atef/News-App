import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/article_respone.dart';

class NewsRepository {
  NewsDataSource dataSource;
  NewsRepository({required this.dataSource});
  Future<List<Articles>>getArticle (String sourceId)async{
    return dataSource.getArticle(sourceId);


  }


}