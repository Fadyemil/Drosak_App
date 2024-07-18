import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_form.dart';
import 'package:flutter/material.dart';

class AudienceBottonSheet extends StatelessWidget {
  const AudienceBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: AudienceForm(),
      ),
    );
  }
}
