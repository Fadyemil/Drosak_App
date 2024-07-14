import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_item_body.dart';
import 'package:flutter/material.dart';

class EdStBody extends StatelessWidget {
  const EdStBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return EdStItemBody();
            },
          ),
        ),
      ],
    );
  }
}
