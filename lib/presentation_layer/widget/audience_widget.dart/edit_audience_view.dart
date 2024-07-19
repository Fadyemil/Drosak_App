import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/edit_audience_body.dart';
import 'package:flutter/material.dart';

class EditAudienceView extends StatelessWidget {
  const EditAudienceView({super.key, required this.audienceModel});
  final AudienceModel audienceModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: EditAudienceBody(
          audienceModel: audienceModel,
        ),
      ),
    );
  }
}
