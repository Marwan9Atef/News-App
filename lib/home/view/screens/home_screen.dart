import 'package:flutter/material.dart';
import 'package:news/categories/view/screens/category_view.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/categories/view_model/category_view_model.dart';
import 'package:news/news/view/screens/news_view.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
CategoryViewModel? selectedCategory;

void onCategorySelected(CategoryViewModel category){
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
body:selectedCategory==null?CategoryView(onCategorySelected: onCategorySelected,):NewsView(selectedCategoryId: selectedCategory!.id),
drawer: HomeDrawer(onGoToHomeClicked: resetSelectedCategory),
    );
  }
}
