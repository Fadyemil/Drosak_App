import 'package:drosak/business_logic_layer/cubit/app_theme_cubit.dart';
import 'package:drosak/business_logic_layer/cubit/themestate.dart';
import 'package:drosak/business_logic_layer/select_page/select_page_cubit.dart';
import 'package:drosak/business_logic_layer/select_page/select_page_state.dart';
// import 'package:drosak/business_logic_layer/theme/theme_bloc.dart';
import 'package:drosak/presentation_layer/widget/home_widget/botton_navigi_bar.dart';
import 'package:drosak/presentation_layer/widget/home_widget/get_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SelectPageCubit, SelectPageState>(
        builder: (context, state) {
          Size size = MediaQuery.sizeOf(context);
          return Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                         context.read<AppThemeCubit>().ChangeTheme(Themestate.light);
                        },
                        child: const Text('Light theme')),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                           context.read<AppThemeCubit>().ChangeTheme(Themestate.dark);
                        },
                        child: const Text('Dark theme')),
                  ],
                ),
              ),
            ),
            body: getPage((state.index)),
            bottomNavigationBar: Container(
              width: 430,
              height: 83,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: bottonNavigiBar(
                selectedIndex: state.index,
                onItemTapped: (int x) {
                  BlocProvider.of<SelectPageCubit>(context).chage(index: x);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
