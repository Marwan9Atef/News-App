import 'package:flutter/cupertino.dart';
import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source_respone.dart';

class SourcesViewModel with ChangeNotifier {
  bool isLoading=false;
  SourcesDataSource sourcesDataSource=SourcesDataSource();
  List<Sources>sources=[];
  String? errorMessage;
  Future<void> getSources(String categoryId)async {
    isLoading=true;
    try {
      SourceRespone response = await sourcesDataSource.getSources(categoryId);
      if(response.status=="ok"&&response.sources!=null){
      sources = response.sources!;
      }else{
        errorMessage="Something went wrong";
      }
    }catch(error){
      errorMessage=error.toString();

    }
    isLoading=false;
    notifyListeners();

  }


}