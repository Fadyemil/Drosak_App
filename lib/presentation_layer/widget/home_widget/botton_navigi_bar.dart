// import 'package:bloc/bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:drosak/business_logic_layer/cubit/app_theme_cubit.dart';
// import 'package:drosak/business_logic_layer/cubit/themestate.dart';

class BottomNavigiBar extends StatefulWidget {
  const BottomNavigiBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  State<BottomNavigiBar> createState() => _BottomNavigiBarState();
  final void Function(int) onItemTapped;
  final int selectedIndex;
}

class _BottomNavigiBarState extends State<BottomNavigiBar> {
  @override
  Widget build(BuildContext context) {
    // استخدام AppThemeCubit للحصول على الحالة الحالية
    var themeState = context.watch<AppThemeCubit>().state;
    bool isDarkMode = themeState is DarkCubit;

    return Scaffold(
      backgroundColor: isDarkMode ? ColorConst.kBlackColor : Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: isDarkMode ? ColorConst.kBlackColor : Colors.white,
        color: isDarkMode ? ColorConst.kBlackLight : Colors.white,
        buttonBackgroundColor:
            isDarkMode ? ColorConst.kWhiteColor : Colors.blueGrey[600],
        onTap: widget.onItemTapped,
        letIndexChange: (index) => true,
        items: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/educational_stages.svg',
                // color: isDarkMode ? Colors.white : Colors.black,
              ),
              const Text(
                'Educational Stages',
                style: TextStyle(
                  color: ColorConst.kGrey1,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/Group.svg',
                // color: isDarkMode ? Colors.white : Colors.black,
              ),
              const Text(
                'Group',
                style: TextStyle(
                  color: ColorConst.kGrey1,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/students.svg',
              ),
              const Text(
                'Students',
                style: TextStyle(
                  color: ColorConst.kGrey1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/audience.svg',
              ),
              const Text(
                'Audience',
                style: TextStyle(
                  color: ColorConst.kGrey1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/payment_icon.svg',
              ),
              const Text(
                'Payment',
                style: TextStyle(
                  color: ColorConst.kGrey1,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
