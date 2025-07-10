import 'package:news/news/data/data_source/news_api_data_source.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import '../sources/data/data_source/sources_api_data_source.dart';
import '../sources/data/data_source/sources_data_source.dart';

class ServicesLocator {
  static NewsDataSource newsDataSource=NewsAPIDataSource();
  static SourcesDataSource sourcesDataSource=SourcesAPIDataSource();




}