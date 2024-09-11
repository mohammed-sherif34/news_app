import 'package:flutter/material.dart';
import 'package:news_app/cubits/config/config_cubit.dart';
import 'package:news_app/cubits/news/news_screen_cubit.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/news/news_screen.dart';
import 'package:news_app/news/web_view_screen.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/simple_bloc_observer.dart';
import 'package:news_app/utils/app_theme.dart';
import 'home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ConfigCubit(),
      ),
      BlocProvider(
  create: (context) => NewsScreenCubit(),
  //child: NewsScreen(),
)

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //ConfigCubit viewModel = ConfigCubit();
  String appLanguage = 'en';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigCubit, ConfigState>(
      // bloc: ConfigCubit(),
      builder: (context, state) {
        if (state is ConfigChangeLanguageState) {
          appLanguage = ConfigCubit.language;
        }
        return MaterialApp(
          locale: Locale.fromSubtags(languageCode: appLanguage),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // arabic
          ],
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            NewsScreen.name: (context) => const NewsScreen(),
            SearchScreen.name: (context) => const SearchScreen(),
            NewsDetailsScreen.name: (context) => NewsDetailsScreen(),
            WebViewScreen.name: (context) => const WebViewScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
