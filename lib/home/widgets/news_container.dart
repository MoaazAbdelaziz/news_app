import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/home/widgets/news_item.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/sources_response/source.dart';

class NewsContainer extends StatefulWidget {
  const NewsContainer({super.key, required this.source});
  final Source source;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNewsBySourceID(widget.source.id ?? ''),
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
                  ApiManger.getNewsBySourceID(widget.source.id ?? '');
                  setState(() {});
                },
                child: const Text(
                  'Try again',
                ),
              ),
            ],
          );
        }

        if (snapshot.data?.status != 'ok') {
          return Text(snapshot.data?.message ?? 'Something went wrong');
        }

        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
