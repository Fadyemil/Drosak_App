import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';

class EdStItemBody extends StatelessWidget {
  const EdStItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        width: size.width,
        height: size.height * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConst.kPrimaryColor),
        ),
        child: ListTile(
          title: Text(
            'seventh grade',
            style: TextStyle(
              color: ColorConst.kWhiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          subtitle: Text(
            '''That class is the middle school class,That class is the middle class, and there are three students, 
for example.''',
            textScaler: TextScaler.linear(1),
            softWrap: false,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorConst.kWhiteColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: Icon(Icons.delete),
              )
            ],
          ),
        ));
  }
}
