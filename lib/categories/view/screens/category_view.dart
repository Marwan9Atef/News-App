import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/view_model/category_view_model.dart';

class CategoryView extends StatelessWidget {
void Function(CategoryViewModel) onCategorySelected;
CategoryView({required this.onCategorySelected});


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
,itemBuilder: (context, index) => GestureDetector(onTap: () {
  onCategorySelected(CategoryViewModel.category[index]);
},child: CategoryItem(category:CategoryViewModel.category[index],)), separatorBuilder: (context, index) => SizedBox(
  height: 10,

), itemCount: CategoryViewModel.category.length))

        ],


      ),
    );
  }
}
