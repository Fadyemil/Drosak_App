// ignore_for_file: must_be_immutable

import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.initialValue});

  String? hint;

  final int maxLines;
  String? initialValue;
  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorColor: ColorConst.kPrimaryColor1,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(ColorConst.kPrimaryColor1),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          14,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
