import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/services_locator.dart';
import 'package:news/sources/data/models/source_respone.dart';
import 'package:news/sources/data/repositories/sources_repositories.dart';
import 'package:news/sources/view_model/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesState> {

late SourcesRepository repository;
SourcesViewModel():super(SourcesInitialState()){
  repository=SourcesRepository(dataSource: ServicesLocator.sourcesDataSource);

}
  List<Sources>sources=[];
  String? errorMessage;
  Future<void> getSources(String categoryId)async {
 emit(GetSourcesIsLoadingState());
    try {
       sources = await repository.getSources(categoryId);
       emit(GetSourcesSuccessState(sources: sources));
    }catch(error){
      emit(GetSourcesErrorState(errorMessage: error.toString()));

    }


  }


}