import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home_screen.dart';

void main(){
  runApp(NewsApp());


}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen()
      },
initialRoute: HomeScreen.routeName,
      darkTheme:AppTheme.darkMode,
      themeMode:ThemeMode.dark,

    );
  }
}
