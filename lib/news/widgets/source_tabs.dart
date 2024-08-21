import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/news/widgets/source_tap.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabs extends StatefulWidget {
  final Function(String) onSourceSelected;
  final CategoryData category;

  const SourceTabs({super.key, required this.onSourceSelected, required this.category});

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  late Future<Source?> sourceFuture;
  int selectIndex = 0;

  @override
  void initState() {
    sourceFuture = ApiManager.getSourcesByCategory(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Source?>(
      future: sourceFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .08,
            width: MediaQuery.of(context).size.width, // Define a width
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.sources!.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    selectIndex = index;
                    widget.onSourceSelected(snapshot.data!.sources![index].id!);
                    setState(() {});
                  },
                  child: SourceTap(
                    isSelected: index == selectIndex,
                    title: snapshot.data!.sources![index].name!,
                    index: index,
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(
          child:  CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
