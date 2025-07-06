import 'package:flutter/material.dart';
import 'package:news/categories/category_view.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_view.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
CategoryModel? selectedCategory;

void onCategorySelected(CategoryModel category){
  selectedCategory=category;
setState(() {

});
}
void resetSelectedCategory() {
  if (selectedCategory == null) return;

  selectedCategory = null;
  setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:selectedCategory==null?Text("Home"):Text(selectedCategory!.name),

      ),
body:selectedCategory==null?CategoryView(onCategorySelected: onCategorySelected,):NewsView(sourceId: selectedCategory!.id),
drawer: HomeDrawer(onGoToHomeClicked: resetSelectedCategory),
    );
  }
}
