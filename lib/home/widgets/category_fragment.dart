import 'package:flutter/material.dart';
import 'package:news_app/home/widgets/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryFragment extends StatefulWidget {
  const CategoryFragment({super.key, required this.onCategoryTap});
  final void Function(CategoryModel) onCategoryTap;

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  var categoryList = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    widget.onCategoryTap(categoryList[index]);
                  },
                  child: CategoryItem(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
