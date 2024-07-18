import 'package:drosak/data_layer/models/student_model.dart';
import 'package:drosak/presentation_layer/widget/student_widget/edit_student_body.dart';
import 'package:flutter/material.dart';

class EditStudentView extends StatelessWidget {
  const EditStudentView({super.key, required this.studentModel});
final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditStudentBody(studentModel: studentModel)),
    );
  }
}