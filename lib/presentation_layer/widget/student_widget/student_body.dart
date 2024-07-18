import 'package:drosak/presentation_layer/widget/student_widget/student_Item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StudentBody extends StatefulWidget {
  const StudentBody({super.key});

  @override
  State<StudentBody> createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return StudentItemBody().animate().fade(
                        delay: Duration(milliseconds: 250),
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                }))
      ],
    );
  }
}
