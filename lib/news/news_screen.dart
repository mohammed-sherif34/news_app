import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  static const name = 'NewsScreen';
  @override
  Widget build(BuildContext context) {
    CategoryData category = ModalRoute.of(context)!.settings.arguments as CategoryData;
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
      ),
    );
  }
}
