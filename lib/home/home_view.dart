import 'package:flutter/material.dart';
import 'package:news_app/home/widgets/category_details.dart';
import 'package:news_app/home/widgets/category_fragment.dart';
import 'package:news_app/home/widgets/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String routeName = 'Home-View';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              selectedItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: selectedItem == HomeDrawer.settings
              ? const SettingsView()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryTap: onCategoryClick,
                    )
                  : CategoryDetails(category: selectedCategory!),
          drawer: Drawer(
            child: HomeDrawer(
              onSideMenueItemTap: onSideMenuItemClick,
            ),
          ),
        ),
      ],
    );
  }

  CategoryModel? selectedCategory;
  int selectedItem = HomeDrawer.category;

  void onCategoryClick(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onSideMenuItemClick(int newSelectedItem) {
    selectedItem = newSelectedItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
