import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response/source.dart';
import 'package:news_app/my_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.source, required this.isSelected});
  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3,
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyTheme.whiteColor,
                )
            : Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
      ),
    );
  }
}
