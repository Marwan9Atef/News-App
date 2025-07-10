import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source_respone.dart';

class SourcesRepository {
  SourcesDataSource dataSource;
  SourcesRepository({required this.dataSource});
  Future<List<Sources>> getSources(String categoryId)async{
    return dataSource.getSources(categoryId);



  }



}