import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/business_logic_layer/groub_add/groub_add_cubit.dart';
import 'package:drosak/business_logic_layer/select_page/select_page_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/screen/appPage.dart';
import 'package:drosak/presentation_layer/widget/home_widget/splash_screen.dart';
// import 'package:drosak/presentation_layer/screen/home_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EdStModelAdapter());
  Hive.registerAdapter(GroubModelAdapter());
  await Hive.openBox<EdStModel>(KEdStBox);
  await Hive.openBox<GroubModel>(KGroubBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConst.kBlackColor,
          appBarTheme: AppBarTheme(
            color: ColorConst.kPrimaryColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
            splashIconSize: MediaQuery.sizeOf(context).height,
            splashTransition: SplashTransition.fadeTransition,
            splash: SplashScreen(),
            nextScreen: const ApplicationPage()),
      ),
    );
  }
}
