import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/news/widgets/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Articles> articles = [];
  bool isLoading = false;
  int currentPage = 1;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _fetchNews();
  }

  @override
  void didUpdateWidget(NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      setState(() {
        articles.clear();
        currentPage = 1;
      });
      _fetchNews();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchNews() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    News? newsResponse =
        await ApiManager.getNewsBySourceId(widget.sourceId, page: currentPage);
    if (newsResponse != null && newsResponse.status == 'ok') {
      setState(() {
        articles.addAll(newsResponse.articles ?? []);
        currentPage++;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isLoading) {
      _fetchNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return articles.isEmpty && isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
        : Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: articles.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < articles.length) {
                  return NewsItem(article: articles[index]);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
              },
            ),
          );
  }
}
