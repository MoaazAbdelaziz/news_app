import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/home/widgets/tab_container.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/sources_response.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});
  final CategoryModel category;
  static const String routeName = 'Category-Details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManger.getSources(widget.category.id);
                  setState(() {});
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? 'Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManger.getSources(widget.category.id);
                  setState(() {});
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        }
        var sourceList = snapshot.data?.source ?? [];
        return TabContainer(source: sourceList);
      },
    );
  }
}
