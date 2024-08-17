import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/news/news_screen.dart';

class RightCategoryItem extends StatelessWidget {
  final CategoryData category;

  const RightCategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NewsScreen.name, arguments: category);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03,
              vertical: MediaQuery.of(context).size.height * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(category.picturePath),
              Text(
                category.categoryName,
                style: GoogleFonts.exo(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
        ),
      ),
    );
  }
}
