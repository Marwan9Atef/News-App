import 'package:flutter/cupertino.dart';
import 'package:news/shared/services_locator.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';
import 'package:news/sources/data/models/source_respone.dart';
import 'package:news/sources/data/repositories/sources_repositories.dart';

class SourcesViewModel with ChangeNotifier {
  bool isLoading=false;
late SourcesRepository repository;
SourcesViewModel(){
  repository=SourcesRepository(dataSource: ServicesLocator.sourcesDataSource);

}
  List<Sources>sources=[];
  String? errorMessage;
  Future<void> getSources(String categoryId)async {
    isLoading=true;
    try {
       sources = await repository.getSources(categoryId);
    }catch(error){
      errorMessage=error.toString();

    }
    isLoading=false;
    notifyListeners();

  }


}