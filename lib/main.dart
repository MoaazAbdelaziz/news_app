import 'package:flutter/material.dart';
import 'package:news_app/home/home_view.dart';
import 'package:news_app/my_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
      },
      initialRoute: HomeView.routeName,
    );
  }
}
