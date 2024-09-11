import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTap extends StatelessWidget {
  const SourceTap({
    super.key,
    required this.title,
    required this.isSelected,
    required this.index,
  });
  final bool isSelected;
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.primaryColor : AppColors.white),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.exo(
              textStyle: isSelected
                  ? Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16)
                  : Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.primaryColor,fontSize: 16)),
        ),
      ),
    );
  }
}
