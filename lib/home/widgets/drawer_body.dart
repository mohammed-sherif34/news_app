import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody(
      {super.key,
      required this.selectCategoryView,
      required this.selectSettingsView});
  final VoidCallback selectCategoryView;
  final VoidCallback selectSettingsView;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .15,
          color: AppColors.primaryColor,
          child: Center(
            child: Text(
              'NewsApp!',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              selectCategoryView();
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.view_list_sharp,
                  size: 35,
                  weight: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categorys,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            selectSettingsView();
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.settings,
                size: 35,
                weight: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.settings,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
