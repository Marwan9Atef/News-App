import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/article_respone.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/data/models/source_respone.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/sources/view/widgets/tab_item.dart';
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
      ChangeNotifierProvider(
        create:(context) => sourcesViewModel,
        child: Consumer<SourcesViewModel>(builder: (_, sourcesViewModel, __) {
          if (sourcesViewModel.isLoading) {
            return LoadingIndicator();
          } else if (sourcesViewModel.errorMessage!=null) {
            return ErrorIndicator(errorMessage: sourcesViewModel.errorMessage!);
          } else {
            List<Sources>sources = sourcesViewModel.sources;
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
                  child: ChangeNotifierProvider(
                    create: (context) => newsViewModel,
                    child: Consumer<NewsViewModel>(builder: (_,newsViewModel, __) {
                      if (newsViewModel.isLoading) {
                        return const LoadingIndicator();
                      } else
                      if (newsViewModel.errorMessage!=null) {
                        return  ErrorIndicator(errorMessage: newsViewModel.errorMessage!);
                      } else {
                        List<Articles> artticles = newsViewModel.article;
                        return ListView.separated(
                            padding: const EdgeInsetsDirectional.only(top: 16),
                            itemBuilder: (context, index) =>
                                NewsItem(article: artticles[index],),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16,),
                            itemCount: artticles.length);
                      }

                    },),
                  )

                )


              ],


            );
          }
        },),
      );
  }}
