import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/news/widgets/source_tabs.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

import 'widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const name = 'NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<Source?> initialSourceFuture;
  CategoryData? category;
  String selectedSourceId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (category == null) {
      category = ModalRoute.of(context)!.settings.arguments as CategoryData;
      initialSourceFuture =
          ApiManager.getSourcesByCategory(category!.id).then((sourceData) {
        if (sourceData != null && sourceData.sources!.isNotEmpty) {
          setState(() {
            selectedSourceId = sourceData.sources![0].id!;
          });
        }
        return sourceData;
      });
    }
  }

  void _onSourceSelected(String sourceId) {
    setState(() {
      selectedSourceId = sourceId;
      print('Selected Source ID: $selectedSourceId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        leading: Icon(
          color: AppColors.white,
          Icons.menu,
          size: 35,
        ),
        centerTitle: true,
        title: Text(
          category?.categoryName ?? '',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 32.0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.name);
              },
              child: ImageIcon(
                color: AppColors.white,
                size: 27,
                AssetImage(ImagesPath.search),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Source?>(
        future: initialSourceFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SourceTabs(
                  category: category!,
                  onSourceSelected: _onSourceSelected,
                ),
                if (selectedSourceId.isNotEmpty)
                  NewsList(
                    sourceId: selectedSourceId,
                    key: ValueKey(selectedSourceId),
                  )
                else
                  const Center(child: Text('No sources available')),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
