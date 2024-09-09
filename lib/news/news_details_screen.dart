import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/news/web_view_screen.dart';
import 'package:news_app/news/widgets/news_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class NewsDetailsScreen extends StatelessWidget {
  //const NewsDetailsScreen({super.key});
  static const String name = 'NewsDetailsScreen';
  Articles? article;

  // ignore: prefer_const_constructors_in_immutables
  NewsDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
          size: 30, // Change this to the color you want
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        centerTitle: true,
        title: Text(
          article?.title ?? '',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: NewsImage(article: article!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8),
              child: Text(
                article?.author ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8),
              child: Text(
                article?.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.lightGray),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                article?.publishedAt ?? '',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8),
              child: Text(
                maxLines: 8,
                article?.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, WebViewScreen.name,
                    arguments: article);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.viewFullArticle,
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.black),
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
