import 'package:drosak/presentation_layer/screen/appPage.dart';
import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp(
      {super.key,
      required this.text,
      this.add,
      this.search,
      this.onMenuPressed});
  final String text;
  final void Function()? add;
  final void Function()? search;
  final void Function()? onMenuPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text),
      actions: [
        IconButton(
          onPressed: search,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
      leading: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: add,
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          )
        ],
      ),
    );
  }
}
