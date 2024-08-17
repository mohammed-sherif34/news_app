import 'package:flutter/material.dart';

class CategoryData {
  final String categoryName;
  final String picturePath;
  final Color color;

  CategoryData(
      {required this.color,
      required this.categoryName,
      required this.picturePath});
}
