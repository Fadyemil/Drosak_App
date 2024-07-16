import 'package:drosak/presentation_layer/widget/groub_widget.dart/dropdown_field.dart';
import 'package:flutter/material.dart';

class GroubForm extends StatefulWidget {
  const GroubForm({super.key});

  @override
  State<GroubForm> createState() => _GroubFormState();
}

class _GroubFormState extends State<GroubForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final List<String> educationalLevel = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
    'Grade 6',
    'Grade 7',
    'Grade 8',
    'Grade 9',
    'Grade 10',
    'Grade 11',
    'Grade 12',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                'educational level',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: 'Choose the educational stage',
                    items: educationalLevel,
                    selectedValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
