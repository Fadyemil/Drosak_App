import 'package:bloc/bloc.dart';
import 'package:drosak/business_logic_layer/cubit/themestate.dart';
import 'package:drosak/data_layer/helper/sh_re.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  ChangeTheme(Themestate state) {
    switch (state) {
      case Themestate.initial:
        if (sharedPreferences!.getString('theme') != null) {
          if (sharedPreferences!.getString('theme') == 'L') {
            emit(LightCubit());
          } else {
            emit(DarkCubit());
          }
        }
        break;
      case Themestate.light:
        sharedPreferences!.setString('theme', 'L');
        emit(LightCubit());
        break;
      case Themestate.dark:
        sharedPreferences!.setString('theme', 'D');
        emit(DarkCubit());
        break;
      default:
    }
  }
}
