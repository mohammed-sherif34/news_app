import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/category_data.dart';
import 'package:news_app/home/widgets/category_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/images.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryData> categoryItemList = [
      CategoryData(
          id: 'sports',
          categoryName: AppLocalizations.of(context)!.sports,
          picturePath: ImagesPath.ball,
          color: AppColors.red),
      CategoryData(
          id: 'science',
          categoryName: AppLocalizations.of(context)!.science,
          picturePath: ImagesPath.science,
          color: AppColors.yellow),
      CategoryData(
          id: 'entertainment',
          categoryName: AppLocalizations.of(context)!.enertainment,
          picturePath: ImagesPath.environment,
          color: AppColors.lightBlue),
      CategoryData(
          id: 'technology',
          categoryName: AppLocalizations.of(context)!.technology,
          picturePath: ImagesPath.politics,
          color: AppColors.darkBlue),
      CategoryData(
          id: 'health',
          categoryName: AppLocalizations.of(context)!.health,
          picturePath: ImagesPath.health,
          color: AppColors.pink),
      CategoryData(
          id: 'business',
          categoryName: AppLocalizations.of(context)!.business,
          picturePath: ImagesPath.bussines,
          color: AppColors.orange),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context)!.pickYourCategory}\n${AppLocalizations.of(context)!.ofInterest}',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.darkGray, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * .045,
                mainAxisSpacing: MediaQuery.of(context).size.height * .025,
              ),
              itemCount: categoryItemList.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                    index: index, category: categoryItemList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
