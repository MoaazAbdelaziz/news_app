import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: 'assets/ball.png',
        color: MyTheme.redColor,
      ),
      CategoryModel(
        id: 'general',
        title: 'General',
        image: 'assets/Politics.png',
        color: MyTheme.darkBlueColor,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image: 'assets/health.png',
        color: MyTheme.pinkColor,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image: 'assets/bussines.png',
        color: MyTheme.brownColor,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image: 'assets/environment.png',
        color: MyTheme.blueColor,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image: 'assets/science.png',
        color: MyTheme.yellowColor,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        image: 'assets/ball.png',
        color: MyTheme.greyColor,
      ),
    ];
  }
}
