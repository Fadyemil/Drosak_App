import 'package:drosak/presentation_layer/widget/groub_widget.dart/groub_form.dart';
import 'package:flutter/material.dart';

class GroubBottonSheet extends StatelessWidget {
  const GroubBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .75,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(child: GroubForm()),
      ),
    );
  }
}
