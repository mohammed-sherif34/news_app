import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/widgets/drop_down_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: 20,
              top: 20,
              start: MediaQuery.of(context).size.width * .08),
          child: Text(
           AppLocalizations.of(context)!.language,
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .1),

            //width: double.infinity,
            height: MediaQuery.of(context).size.height * .05,
            child: const DropDownLanguage())
      ],
    );
  }
}

