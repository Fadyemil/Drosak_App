import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_body.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_bottm_sheet.dart';
// import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_item_body.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EducationalStages extends StatelessWidget {
  const EducationalStages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarApp(
            text: 'Educational Stages',
            add: () {
              showModalBottomSheet(
                backgroundColor: Color.fromARGB(255, 71, 70, 60),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return EdStBottmSheet();
                },
              );
            },
          ),
          Expanded(child: EdStBody()),
        ],
      ),
    );
  }
}
