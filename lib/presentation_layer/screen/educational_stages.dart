// ignore_for_file: must_be_immutable

import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EducationalStages extends StatelessWidget {
  const EducationalStages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarApp(
              text: 'Educational Stages',
            ),
          ],
        ),
      ),
    );
  }
}
