import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/my_theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
  });
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
          bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.image,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.whiteColor,
                ),
          ),
        ],
      ),
    );
  }
}
