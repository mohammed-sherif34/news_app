import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/config/config_cubit.dart';
import 'package:news_app/utils/app_colors.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownLanguage extends StatefulWidget {
  const DropDownLanguage({super.key});

  @override
  State<DropDownLanguage> createState() => _DropDownLanguageState();
}

class _DropDownLanguageState extends State<DropDownLanguage> {
  final List<String> items = [
    'English',
    'العربية',
  ];
  String? selectedValue;
  ConfigCubit viewModel = ConfigCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigCubit, ConfigState>(
      builder: (context, state) {
        String selectedValue =
            ConfigCubit.language == 'en' ? 'English' : 'العربية';
        if (ConfigCubit.language == 'en') {}
        return Scaffold(
          body: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                selectedValue,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                if (value != null) {
                  final cubit = context.read<ConfigCubit>();
                  cubit.changeLanguage(value == 'English' ? 'en' : 'ar');
                }
              },
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor)),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
