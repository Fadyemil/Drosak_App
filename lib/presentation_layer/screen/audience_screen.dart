import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_body.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_botton_sheet.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AudienceScreen extends StatelessWidget {
  const AudienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarApp(
            text: 'Audience',
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
                    child: AudienceBottonSheet(),
                  );
                },
              );
            },
          ),
          Expanded(
            child: AudienceBody(),
          ),
        ],
      ),
    );
  }
}
