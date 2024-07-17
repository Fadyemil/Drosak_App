// ignore_for_file: unused_local_variable

import 'package:drosak/business_logic_layer/groub_add/groub_add_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/dropdown_field.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/select_time_widget.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/title_widget.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String? selectedValueLevel, day, nameGroub, subtitle, numberStudent;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TimeOfDay? time;
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        time = value;
      });
    });
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) {
      return 'No Time Selected';
    }
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format =
        MediaQuery.of(context).alwaysUse24HourFormat ? 'HH:mm' : 'h:mm a';
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: CustomTextField(
              onSaved: (value) {
                nameGroub = value;
              },
              hint: 'Enter the name groub',
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TitleWidget(title: 'educational level'),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: 'Choose the educational stage',
                    items: educationalLevel,
                    selectedValue: selectedValueLevel,
                    onChanged: (value) {
                      setState(() {
                        selectedValueLevel = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TitleWidget(title: 'day'),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: 'Choose today',
                    items: daysOfWeek,
                    selectedValue: day,
                    onChanged: (value) {
                      setState(() {
                        day = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TitleWidget(
                title: 'Time Picker',
              ),
              const SizedBox(width: 16),
              SelectTime(
                onTap: _showTimePicker,
                formattedTime: _formatTime(time),
              ),
            ],
          ),
          SizedBox(height: 15),
          CustomTextField(
            hint: ' enter number of students',
            onSaved: (value) {
              numberStudent = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hint: 'comments',
            maxLines: 4,
          ),
          SizedBox(height: 15),
          BlocBuilder<GroubAddCubit, GroubAddState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is GroubAddLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    String currentDate = _formatTime(time).toString();
                    GroubModel groubModel = GroubModel(
                      nameGroub: nameGroub!,
                      edLevel: selectedValueLevel!,
                      timePacker: currentDate,
                      numberStudent: numberStudent!,
                      subtitle: subtitle!,
                      day: day!,
                    );
                    context.read<GroubAddCubit>().addGroub(groubModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
