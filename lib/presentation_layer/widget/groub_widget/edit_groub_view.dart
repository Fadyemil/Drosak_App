import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/edit_groub_body.dart';
import 'package:flutter/material.dart';

class EditGroubView extends StatelessWidget {
  const EditGroubView({super.key, required this.groubModel});

  final GroubModel groubModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditGroubBody(groubModel: groubModel)),
    );
  }
}
