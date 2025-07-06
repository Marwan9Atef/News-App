import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';

class NewsView extends StatefulWidget {
  String sourceId;
  NewsView({required this.sourceId});
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
 List<SourceModel>sources=List.generate(10, (index)=>SourceModel(id: "$index", name:"source $index"));
int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Column(
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
        padding: EdgeInsetsDirectional.only(start: 15),
        labelPadding: EdgeInsetsDirectional.only(end: 16),
        tabAlignment: TabAlignment.start
    ,tabs: sources.map((source) =>TabItem(source: source, isSlected:currentIndex==sources.indexOf(source) ) ,).toList()),
  ),
  Expanded(child: ListView.separated(padding: EdgeInsetsDirectional.only(top:16),itemBuilder: (context, index) => NewsItem(), separatorBuilder: (context, index) => SizedBox(height: 16,), itemCount: 5))



],


    );
  }
}
