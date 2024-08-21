import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/images.dart';

class CategoryData {
  final String id;
  final String categoryName;
  final String picturePath;
  final Color color;

  CategoryData(
      {required this.id,
      required this.color,
      required this.categoryName,
      required this.picturePath});
//business entertainment general health science sports technology
  static List<CategoryData> categoryItemList = [
    CategoryData(
        id: 'sports',
        categoryName: 'Sports',
        picturePath: ImagesPath.ball,
        color: AppColors.red),
    CategoryData(
        id: 'science',
        categoryName: 'Science',
        picturePath: ImagesPath.science,
        color: AppColors.yellow),
    CategoryData(
        id: 'entertainment',
        categoryName: 'Entertainment',
        picturePath: ImagesPath.environment,
        color: AppColors.lightBlue),
    CategoryData(
        id: 'technology',
        categoryName: 'Technology',
        picturePath: ImagesPath.politics,
        color: AppColors.darkBlue),
    CategoryData(
        id: 'health',
        categoryName: 'Health',
        picturePath: ImagesPath.health,
        color: AppColors.pink),
    CategoryData(
        id: 'business',
        categoryName: 'Business',
        picturePath: ImagesPath.bussines,
        color: AppColors.orange),
  ];
}
/*
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.darkGray, fontWeight: FontWeight.bold)),
          ),
         
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LeftCategoryItem(
                  category: CategoryData(
                      categoryName: 'Sports',
                      picturePath: ImagesPath.ball,
                      color: AppColors.red),
                ),
                RightCategoryItem(
                  category: CategoryData(
                      categoryName: 'Politics',
                      picturePath: ImagesPath.politics,
                      color: AppColors.darkBlue),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LeftCategoryItem(
                  category: CategoryData(
                      categoryName: 'Health',
                      picturePath: ImagesPath.health,
                      color: AppColors.pink),
                ),
                RightCategoryItem(
                  category: CategoryData(
                      categoryName: 'Bussines',
                      picturePath: ImagesPath.bussines,
                      color: AppColors.orange),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LeftCategoryItem(
                  category: CategoryData(
                      categoryName: 'Environment',
                      picturePath: ImagesPath.environment,
                      color: AppColors.lightBlue),
                ),
                RightCategoryItem(
                  category: CategoryData(
                      categoryName: 'Science',
                      picturePath: ImagesPath.science,
                      color: AppColors.yellow),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/