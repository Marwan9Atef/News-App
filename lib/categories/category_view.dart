import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextTheme style=Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text("Good Morning",style: style.titleMedium,),
      Text("Here is Some News For You",style: style.titleMedium,),
Expanded(child: ListView.separated(
  padding: EdgeInsets.only(top: 16)
,itemBuilder: (context, index) => CategoryItem(category:CategoryModel.category[index],), separatorBuilder: (context, index) => SizedBox(
  height: 10,

), itemCount: CategoryModel.category.length))

        ],


      ),
    );
  }
}
