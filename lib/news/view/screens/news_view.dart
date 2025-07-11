import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/article_respone.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/data/models/source_respone.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
import 'package:news/sources/view_model/sources_state.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';

class NewsView extends StatefulWidget {
  String selectedCategoryId;
  NewsView({required this.selectedCategoryId});
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  SourcesViewModel sourcesViewModel=SourcesViewModel();
  NewsViewModel newsViewModel=NewsViewModel();
int currentIndex=0;
@override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.selectedCategoryId);
  }


  @override
  Widget build(BuildContext context) {
    return
      BlocProvider<SourcesViewModel>(
        create:(context) => sourcesViewModel,
        child: BlocBuilder<SourcesViewModel,SourcesState>(builder: (_,state) {
          if (state is GetSourcesIsLoadingState) {
            return const LoadingIndicator();
          } else if (state is GetSourcesErrorState) {
            return ErrorIndicator(errorMessage:state.errorMessage);
          } else if (state is GetSourcesSuccessState){
            List<Sources>sources = state.sources;
            newsViewModel.getSources(sources[currentIndex].id!);
            return Column(
              children: [
                DefaultTabController(
                  length: sources.length,
                  child: TabBar(onTap: (index) {
                    if (currentIndex == index) return;
                    currentIndex = index;
                    setState(() {

                    });
                  },
                      isScrollable: true,
                      indicatorColor: AppTheme.white,
                      dividerColor: Colors.transparent,
                      padding: const EdgeInsetsDirectional.only(start: 15),
                      labelPadding: const EdgeInsetsDirectional.only(end: 16),
                      tabAlignment: TabAlignment.start
                      ,
                      tabs: sources.map((source) => TabItem(source: source,
                          isSlected: currentIndex == sources.indexOf(source)),)
                          .toList()),
                ),
                Expanded(
                  child: BlocProvider<NewsViewModel>(
                    create: (context) => newsViewModel,
                    child: BlocBuilder<NewsViewModel,NewsState>(builder: (_,state) {
                      if (state is GetNewsIsLoadingState) {
                        return const LoadingIndicator();
                      } else
                      if (state is GetNewsErrorState) {
                        return  ErrorIndicator(errorMessage: state.errorMesssage);
                      } else if(state is GetNewsSuccessState) {
                        List<Articles> artticles = state.article;
                        return ListView.separated(
                            padding: const EdgeInsetsDirectional.only(top: 16),
                            itemBuilder: (context, index) =>
                                NewsItem(article: artticles[index],),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16,),
                            itemCount: artticles.length);
                      }else{
                        return const SizedBox();
                      }

                    },),
                  )

                )


              ],


            );
          }else{
            return const SizedBox();
          }
        },),
      );
  }}
