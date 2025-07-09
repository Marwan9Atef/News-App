import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source_respone.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.source,required this.isSlected});
Sources source;
bool isSlected;

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Text(source.name??"",style:isSlected?textStyle.labelMedium:textStyle.labelSmall,);
  }
}
