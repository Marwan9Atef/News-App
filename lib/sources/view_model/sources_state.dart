import 'package:news/sources/data/models/source_respone.dart';

abstract class SourcesState {}

class SourcesInitialState extends SourcesState{}
class GetSourcesIsLoadingState extends SourcesState{

}
class GetSourcesSuccessState extends SourcesState{
  final List<Sources> sources;
  GetSourcesSuccessState({required this.sources});
}
class GetSourcesErrorState extends SourcesState{
  final String errorMessage;
  GetSourcesErrorState({required this.errorMessage});
}
