import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/news/widgets/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late Future<News?> news;

  @override
  void initState() {
    super.initState();
    news = ApiManager.getNewsBySourceId(widget.sourceId);
  }

  @override
  void didUpdateWidget(NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      setState(() {
        news = ApiManager.getNewsBySourceId(widget.sourceId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News?>(
      future: news,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.hasData) {
          print('API Response: ${snapshot.data}');
          if (snapshot.data?.status == 'ok') {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data?.articles?.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: NewsItem(article: snapshot.data!.articles![index]),
                  );
                },
              ),
            );
          } else {
            return const Text('No data available');
          }
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
