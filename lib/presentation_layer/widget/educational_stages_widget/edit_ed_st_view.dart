import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/edit_ed_st_body.dart';
import 'package:flutter/material.dart';

class EditEdStView extends StatelessWidget {
  const EditEdStView({super.key, required this.edStModel});

  final EdStModel edStModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: EditEdStBody(edStModel: edStModel)
    );
  }
}
