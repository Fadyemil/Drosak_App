import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:drosak/presentation_layer/widget/student_widget/student_botton_sheet.dart';
import 'package:flutter/material.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBarApp(
          text: 'Student',
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
                  child: StudentBottonSheet(),
                );
              },
            );
          },
          search: () {},
        )
      ],
    ));
  }
}
