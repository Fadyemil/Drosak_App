import 'package:drosak/business_logic_layer/select_page/select_page_cubit.dart';
import 'package:drosak/business_logic_layer/select_page/select_page_state.dart';
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
          return Scaffold(
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
