import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/cubits/news/news_screen_cubit.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/news/widgets/news_list.dart';
import 'package:news_app/news/widgets/source_tabs.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const name = 'NewsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  CategoryData? category;
  String selectedSourceId = '';

  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (category == null) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is CategoryData) {
        category = routeArgs;
        final cubit = context.read<NewsScreenCubit>();
        cubit.getTabs(category!.id);
      } else {
        Navigator.pop(context);
      }
    }
  }

  void _onSourceSelected(String sourceId) {
    setState(() {
      selectedSourceId = sourceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
          size: 30,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .07,
        centerTitle: true,
        title: Text(
          category?.categoryName ?? 'News',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 24.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.name);
              },
              child: const ImageIcon(
                color: AppColors.white,
                size: 25,
                AssetImage(ImagesPath.search),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NewsScreenCubit, NewsScreenState>(
        builder: (context, state) {
          if (state is SourceSuccess) {
            final sources = state.sourcesList;

            // Set the initial selectedSourceId to the first source if not already set
            if (selectedSourceId.isEmpty && sources.isNotEmpty) {
              selectedSourceId = sources.first.id!;
            }

            return Column(
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
              ],
            );
          } else if (state is SourceError) {
            return Center(child: Text('Error: ${state.errMsg}'));
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
