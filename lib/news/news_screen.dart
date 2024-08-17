import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/news/widgets/source_tabs.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

import 'widgets/news_list.dart';
import 'widgets/source_tap.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const name = 'NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String selectedSourceId = 'abc-news'; // Initialize with a default source ID

  void _onSourceSelected(String sourceId) {
    setState(() {
      selectedSourceId = sourceId;
      print('Selected Source ID: $selectedSourceId');
    });
  }

  @override
  Widget build(BuildContext context) {
    CategoryData category =
        ModalRoute.of(context)!.settings.arguments as CategoryData;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        leading: Icon(
          color: AppColors.white,
          Icons.menu,
          size: 35,
        ),
        centerTitle: true,
        title: Text(
          category.categoryName,
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 32.0,
            ),
            child: ImageIcon(
              color: AppColors.white,
              size: 27,
              AssetImage(ImagesPath.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SourceTabs(onSourceSelected: _onSourceSelected),
            ],
          ),
          Expanded(
            child: NewsList(sourceId: selectedSourceId),
          ),
        ],
      ),
    );
  }
}
