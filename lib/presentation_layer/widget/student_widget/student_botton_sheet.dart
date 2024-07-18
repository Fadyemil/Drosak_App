import 'package:drosak/presentation_layer/widget/student_widget/student_form.dart';
import 'package:flutter/material.dart';

class StudentBottonSheet extends StatelessWidget {
  const StudentBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.85,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: StudentForm(),
        ),
      ),
    );
  }
}
