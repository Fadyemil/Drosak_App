import 'package:drosak/presentation_layer/widget/educational_stages_widget/add_ed_st_form.dart';
import 'package:flutter/material.dart';

class EdStBottmSheet extends StatelessWidget {
  const EdStBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: AddEdStForm(),
      ),
    );
  }
}
