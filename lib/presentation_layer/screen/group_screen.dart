import 'package:drosak/presentation_layer/widget/groub_widget.dart/groub_botton_sheet.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBarApp(
          text: 'Groub',
          add: () {
            showModalBottomSheet(
              backgroundColor: Color.fromARGB(255, 16, 112, 124),
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: GroubBottonSheet(),
                );
              },
            );
          },
        ),
      ],
    ));
  }
}
