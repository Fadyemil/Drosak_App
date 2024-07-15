import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorConst.kBlackColor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Image.asset('assets/images/splash_border_image.png'),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset('assets/images/logo.png'),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child:
                  Image.asset("assets/images/splash_border_image_bottom.png"),
            ),
          ],
        ),
      ),
    );
  }
}
