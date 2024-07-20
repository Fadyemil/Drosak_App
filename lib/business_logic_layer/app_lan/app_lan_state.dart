part of 'app_lan_cubit.dart';

@immutable
sealed class AppLanState {}

final class AppLanInitial extends AppLanState {}

final class AppChangeLang extends AppLanState {
  final String? languageCode;

  AppChangeLang({this.languageCode});
}
