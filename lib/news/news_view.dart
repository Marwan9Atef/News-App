import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/article_respone.dart';
import 'package:news/models/source_respone.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';

class NewsView extends StatefulWidget {
  String sourceId;
  NewsView({required this.sourceId});
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
int currentIndex=0;
late Future<SourceRespone>sourceRespone= APIServices.getSources(widget.sourceId);


  @override
  Widget build(BuildContext context) {
     return
     FutureBuilder(future: sourceRespone, builder: (context, snapshot) {
       if(snapshot.connectionState==ConnectionState.waiting){
         return LoadingIndicator();
       }else if(snapshot.hasError || snapshot.data?.status!="ok"){
         return ErrorIndicator();
       }else{
         List<Sources>sources=snapshot.data!.sources??[];
         return   Column(
           children: [
             DefaultTabController(
               length: sources.length,
               child: TabBar(onTap: (index) {
                 if(currentIndex==index)return;
                 currentIndex=index;
                 setState(() {

                 });
               },
                   isScrollable: true,
                   indicatorColor: AppTheme.white,
                   dividerColor: Colors.transparent,
                   padding:const EdgeInsetsDirectional.only(start: 15),
                   labelPadding:const EdgeInsetsDirectional.only(end: 16),
                   tabAlignment: TabAlignment.start
                   ,tabs: sources.map((source) =>TabItem(source: source, isSlected:currentIndex==sources.indexOf(source) ) ,).toList()),
             ),
             Expanded(
               child: FutureBuilder(future: APIServices.getArticle(sources[currentIndex].id!), builder: (context, snapshot) {
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return const LoadingIndicator();
                 }else if(snapshot.hasError||snapshot.data?.status!="ok"){
                   return const ErrorIndicator();
                 }else{
                   List<Articles> artticles=snapshot.data!.articles??[];
                   return  ListView.separated(padding: const EdgeInsetsDirectional.only(top:16),itemBuilder: (context, index) => NewsItem(article: artticles[index],), separatorBuilder: (context, index) => SizedBox(height: 16,), itemCount: artticles.length);


                 }
               },),
             )


           ],


         );
       }

     },);


  }
}
