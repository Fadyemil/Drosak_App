import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key, required this.text, this.add, this.search});
  final String text;
  final void Function()? add;
  final void Function()? search;
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
      leading: IconButton(
        onPressed: add,
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}