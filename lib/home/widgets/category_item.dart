import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(index % 2 == 0 ? 0 : 20),
            bottomRight: Radius.circular(index % 2 == 0 ? 20 : 0),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
