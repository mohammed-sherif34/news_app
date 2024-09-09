import 'package:bloc/bloc.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigInitial());
  static String language = 'en';

  void changeLanguage(newLanguage) {
    if (language == newLanguage) return;
    language = newLanguage;

    emit(ConfigChangeLanguageState());
  }
  
}
