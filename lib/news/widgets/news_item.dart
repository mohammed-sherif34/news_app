import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key, required this.article,
  });
 final Articles article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child:CachedNetworkImage(
        imageUrl: article.urlToImage??'',
        placeholder: (context, url) => Center(
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
     ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              article.author??'',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Text(
              article.title??'',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
             article.publishedAt??'',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
