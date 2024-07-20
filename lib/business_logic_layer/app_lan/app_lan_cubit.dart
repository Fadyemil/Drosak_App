import 'package:bloc/bloc.dart';
import 'package:drosak/business_logic_layer/app_lan/lan_enums.dart';
import 'package:drosak/data_layer/helper/sh_re.dart';
import 'package:meta/meta.dart';

part 'app_lan_state.dart';

class AppLanCubit extends Cubit<AppLanState> {
  AppLanCubit() : super(AppLanInitial());
  appLanguageFunc(Languageenums eventType) {
    switch (eventType) {
      case Languageenums.Initial:
        if (sharedPreferences!.getString('lang') != null) {
          if (sharedPreferences!.getString('lang') == 'ar') {
            emit(AppChangeLang(languageCode: 'ar'));
          } else {
            emit(AppChangeLang(languageCode: 'en'));
          }
        }

        break;
      case Languageenums.english:
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLang(languageCode: 'en'));
        break;
      case Languageenums.arabic:
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLang(languageCode: 'ar'));
        break;
      default:
    }
  }
}
