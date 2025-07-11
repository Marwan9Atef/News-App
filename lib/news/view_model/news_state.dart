import 'package:news/news/data/models/article_respone.dart';

abstract class NewsState {}
class NewsInitialState extends NewsState{}
class GetNewsIsLoadingState extends NewsState{}
class GetNewsSuccessState extends NewsState{
  final List<Articles>article;
  GetNewsSuccessState({required this.article});
}
class GetNewsErrorState extends NewsState{
  final String errorMesssage;
  GetNewsErrorState({required this.errorMesssage});
}