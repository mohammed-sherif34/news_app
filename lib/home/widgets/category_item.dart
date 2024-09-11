import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubits/news/news_screen_cubit.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/news/news_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsScreen.name, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
            // bottomEnd: ,bottomStart: ,topEnd: ,topStart: ,
            bottomStart: Radius.circular(index % 2 == 0 ? 0 : 20),
            bottomEnd: Radius.circular(index % 2 == 0 ? 20 : 0),
            topStart: const Radius.circular(20),
            topEnd: const Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(category.picturePath),
            Text(
              category.categoryName,
              style: GoogleFonts.exo(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
