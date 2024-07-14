import 'package:drosak/presentation_layer/screen/audience_screen.dart';
import 'package:drosak/presentation_layer/screen/educational_stages.dart';
import 'package:drosak/presentation_layer/screen/group_screen.dart';
import 'package:drosak/presentation_layer/screen/payment_screen.dart';
import 'package:drosak/presentation_layer/screen/students.dart';
import 'package:flutter/material.dart';

Widget getPage(int index) {
  switch (index) {
    case 0:
      return EducationalStages();
    case 1:
      return GroupScreen();
    case 2:
      return StudentsScreen();
    case 3:
      return AudienceScreen();
    case 4:
      return PaymentScreen();
    default:
      return Container();
  }
}
