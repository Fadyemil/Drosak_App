import 'package:drosak/business_logic_layer/app_lan/app_lan_cubit.dart';
import 'package:drosak/business_logic_layer/app_lan/lan_enums.dart';
import 'package:drosak/business_logic_layer/cubit/app_theme_cubit.dart';
import 'package:drosak/business_logic_layer/cubit/themestate.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/test.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fady Emil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Fady46t45f@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
                AppLocalizations.of(context)?.translate('home_page') ?? 'Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('اللغة العربية'),
            onTap: () {
              context.read<AppLanCubit>().appLanguageFunc(Languageenums.arabic);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('English'),
            onTap: () {
              context
                  .read<AppLanCubit>()
                  .appLanguageFunc(Languageenums.english);
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Light Theme'),
            onTap: () {
              context.read<AppThemeCubit>().ChangeTheme(Themestate.light);
            },
          ),
          ListTile(
            leading: Icon(Icons.nights_stay),
            title: Text('Dark Theme'),
            onTap: () {
              context.read<AppThemeCubit>().ChangeTheme(Themestate.dark);
            },
          ),
        ],
      ),
    );
  }
}
