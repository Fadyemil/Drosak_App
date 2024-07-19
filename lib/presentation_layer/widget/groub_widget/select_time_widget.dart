import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatelessWidget {
  final Function() onTap;
  final String? formattedTime;

  const SelectTime({
    Key? key,
    required this.onTap,
    this.formattedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: ColorConst.kWhiteColor.withGreen(180),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.access_time),
            SizedBox(width: 8),
            Text(
              'Time: ${formattedTime ?? "No Time Selected"}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
