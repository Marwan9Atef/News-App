import 'package:news/sources/data/models/source_respone.dart';

abstract class SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId);


}