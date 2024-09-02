import 'package:flutter/material.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/news/news_screen.dart';
import 'package:news_app/news/web_view_screen.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/utils/app_theme.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        NewsScreen.name: (context) => const NewsScreen(),
        SearchScreen.name: (context) => const SearchScreen(),
        NewsDetailsScreen.name: (context) => NewsDetailsScreen(),
        WebViewScreen.name: (context) => const WebViewScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
