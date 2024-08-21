import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/utils/app_colors.dart';
import 'widgets/category_item.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
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
          'News App',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.darkGray, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height:  MediaQuery.of(context).size.height * .025,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * .045,
                mainAxisSpacing: MediaQuery.of(context).size.height * .025,
              ),
              itemCount: CategoryData.categoryItemList.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                    index: index,
                    category: CategoryData.categoryItemList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
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