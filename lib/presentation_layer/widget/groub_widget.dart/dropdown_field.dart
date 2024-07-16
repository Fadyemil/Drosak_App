import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hint;
  const DropdownField({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        color: ColorConst.kWhiteColor.withGreen(180),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          // barrierColor: Colors.red,
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
          ),
          isExpanded: true,
          hint: Text(
            '$hint',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
