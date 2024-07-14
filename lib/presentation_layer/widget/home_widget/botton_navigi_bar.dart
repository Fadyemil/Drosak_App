import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:drosak/business_logic_layer/cubit/select_page_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottonNavigiBar extends StatefulWidget {
  const bottonNavigiBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<bottonNavigiBar> createState() => _bottonNavigiBarState();
  final void Function(int) onItemTapped;
  final int selectedIndex;
}

class _bottonNavigiBarState extends State<bottonNavigiBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kBlackColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: ColorConst.kBlackColor,
        color: ColorConst.kBlackLight,
        buttonBackgroundColor: ColorConst.kWhiteColor,
        onTap: widget.onItemTapped,
        letIndexChange: (index) => true,
        items: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/educational_stages.svg'),
              Text(
                'Educational Stages',
                style: TextStyle(color: Color(0xff47463C)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/Group.svg'),
              Text(
                'Group',
                style: TextStyle(color: Color(0xff47463C)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/students.svg'),
              Text(
                'students',
                style: TextStyle(
                  color: Color(0xff47463C),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/audience.svg'),
              Text(
                'audience',
                style: TextStyle(color: Color(0xff47463C)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/payment_icon.svg'),
              Text(
                'payment',
                style: TextStyle(color: Color(0xff47463C)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
