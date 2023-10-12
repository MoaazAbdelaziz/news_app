import 'package:flutter/material.dart';
import 'package:news_app/home/widgets/news_container.dart';
import 'package:news_app/home/widgets/tab_item.dart';
import 'package:news_app/models/sources_response/source.dart';

class TabContainer extends StatefulWidget {
  const TabContainer({super.key, required this.source});
  final List<Source> source;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.source.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: false,
            indicatorColor: Colors.transparent,
            tabs: widget.source
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected: selectedIndex == widget.source.indexOf(source),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: NewsContainer(source: widget.source[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
