import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/app_bloc_observe.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/screens/home_screen.dart';

void main(){
  Bloc.observer=AppBlocObserver();
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
