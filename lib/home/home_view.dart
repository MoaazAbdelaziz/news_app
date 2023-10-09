import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String routeName = 'Home-View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
