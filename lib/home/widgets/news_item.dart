import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/article.dart';
import 'package:news_app/my_theme.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.primayLightColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            news.author ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  color: MyTheme.greyColor,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            news.publishedAt ?? '',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  color: MyTheme.greyColor,
                ),
          ),
        ],
      ),
    );
  }
}
