import 'package:flutter/material.dart';
import 'package:news_app/news/widgets/news_list.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

class SearchScreen extends StatefulWidget {
  static const String name = 'SearchScreen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        centerTitle: true,
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchKey = value.isEmpty ? null : value;
            });
          },
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const ImageIcon(
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
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(40),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          NewsList(
            searchKey: searchKey,
          ),
        ],
      ),
    );
  }
}

