import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';
import 'views/categories_view.dart';
import 'views/settings_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selectCategory = true;
  void selectCategoryView() {
    selectCategory = true;
    Navigator.pop(context);
    setState(() {});
  }

  void selectSettingsView() {
    selectCategory = false;
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shadowColor: AppColors.white,
        child: Column(
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
                      'Categories',
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
                    'Settings',
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
        ),

        // surfaceTintColor: AppColors.orange,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
          size: 33, // Change this to the color you want
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        centerTitle: true,
        title: Text(
          selectCategory?'Categorys':'Settings',
          style: GoogleFonts.exo(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: selectCategory ? const CategoriesView() : const SettingsView(),
    );
  }
}
