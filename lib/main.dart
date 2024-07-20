// ignore_for_file: unused_local_variable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:drosak/business_logic_layer/app_lan/app_lan_cubit.dart';
import 'package:drosak/business_logic_layer/app_lan/lan_enums.dart';
import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/business_logic_layer/audience_add/audience_add_cubit.dart';
import 'package:drosak/business_logic_layer/cubit/app_theme_cubit.dart';
import 'package:drosak/business_logic_layer/cubit/themestate.dart';
// import 'package:drosak/business_logic_layer/cubit/themestate.dart';
import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/business_logic_layer/groub_add/groub_add_cubit.dart';
import 'package:drosak/business_logic_layer/select_page/select_page_cubit.dart';
import 'package:drosak/business_logic_layer/student/student_cubit.dart';
import 'package:drosak/business_logic_layer/student_add/student_add_cubit.dart';
// import 'package:drosak/business_logic_layer/theme/theme_bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:drosak/data_layer/helper/sh_re.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:drosak/presentation_layer/screen/appPage.dart';
import 'package:drosak/presentation_layer/widget/home_widget/splash_screen.dart';
// import 'package:drosak/presentation_layer/screen/home_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EdStModelAdapter());
  Hive.registerAdapter(GroubModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(AudienceModelAdapter());
  await Hive.openBox<EdStModel>(KEdStBox);
  await Hive.openBox<GroubModel>(KGroubBox);
  await Hive.openBox<StudentModel>(KStudentBox);
  await Hive.openBox<AudienceModel>(KAudienceBox);
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit()..ChangeTheme(Themestate.initial),
        ),
        BlocProvider(
          create: (context) =>
              AppLanCubit()..appLanguageFunc(Languageenums.Initial),
        ),
        BlocProvider(
          create: (context) => SelectPageCubit(),
        ),
        BlocProvider(
          create: (context) => EdStCubit(),
        ),
        BlocProvider(
          create: (context) => GroubCubit(),
        ),
        BlocProvider(
          create: (context) => GroubAddCubit(),
        ),
        BlocProvider(
          create: (context) => StudentCubit(),
        ),
        BlocProvider(
          create: (context) => StudentAddCubit(),
        ),
        BlocProvider(
          create: (context) => AudienceCubit(),
        ),
        BlocProvider(
          create: (context) => AudienceAddCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        var themeState = context.select((AppThemeCubit bloc) => bloc.state);
        var langState = context.select((AppLanCubit bloc) => bloc.state);
        return MaterialApp(
          locale: (langState is AppChangeLang)
              ? (langState.languageCode == 'en')
                  ? const Locale('en')
                  : const Locale('ar')
              : const Locale('en'),
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          //~ Delegates for translating texts and UI elements
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          //~ Function to determine the preferred language based on user device settings
          localeListResolutionCallback: (deviceLocale, supportedLocales) {
            //~ Check supported languages and match them with the device language
            for (var locale in supportedLocales) {
              if (deviceLocale != null) {
                Locale device = deviceLocale
                    .first; //* Get the first preferred language on the device
                if (device.languageCode == locale.languageCode) {
                  return device; //* Return device language if supported
                }
              }
            }
            return supportedLocales
                .first; //* Use default language if device language is not supported
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          theme: (themeState is LightCubit) ? lightTheme() : darkTheme(),
          home: AnimatedSplashScreen(
              splashIconSize: MediaQuery.sizeOf(context).height,
              splashTransition: SplashTransition.fadeTransition,
              splash: const SplashScreen(),
              nextScreen: const ApplicationPage()),
        );
      }),
    );
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: ColorConst.kPrimaryColor,
        titleTextStyle: TextStyle(color: Colors.black), // النص في الـ AppBar
      ),
      useMaterial3: true,
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorConst.kBlackColor,
      appBarTheme: const AppBarTheme(
        color: ColorConst.kPrimaryColor,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
