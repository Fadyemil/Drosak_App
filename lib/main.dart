import 'package:drosak/business_logic_layer/cubit/select_page_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/presentation_layer/screen/appPage.dart';
// import 'package:drosak/presentation_layer/screen/home_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        home: const ApplicationPage(),
      ),
    );
  }
}
