import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

class SearchScreen extends StatelessWidget {
  static const String name = 'SearchScreen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(),
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        centerTitle: true,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(
                  ImagesPath.search,
                ),
                color: AppColors.primaryColor,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .01,
              horizontal: MediaQuery.of(context).size.width * .03,
            ),
            fillColor: AppColors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
