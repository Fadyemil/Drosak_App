// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/dropdown_field.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/select_time_widget.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/title_widget.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
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
  List<GroubModel> groupItems = [];
  @override
  void initState() {
    super.initState();
    var data = context.read<GroubCubit>().GroubList;
    if (data != null && data.isNotEmpty) {
      setState(() {
        for (int index = 0; index < data.length; index++) {
          groupItems.add(data[index]);
        }
      });
    }
  }

  final List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String? selectedValueLevel,
      day,
      nameStudent,
      subtitle,
      numberPhoneStudent,
      Select_group,
      date_reg;
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
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: CustomTextField(
              onSaved: (value) {
                nameStudent = value;
              },
              hint: 'Enter the name Student',
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const TitleWidget(title: 'educational level'),
              const SizedBox(width: 8),
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
          const SizedBox(height: 15),
          Row(
            children: [
              const TitleWidget(title: 'Select the group'),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: 'Choose the group',
                    items: groupItems
                        .map((group) => group.nameGroub ?? '')
                        .toList(),
                    selectedValue: Select_group,
                    onChanged: (value) {
                      setState(() {
                        Select_group = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const TitleWidget(title: 'day'),
              const SizedBox(width: 8),
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
          const SizedBox(height: 15),
          Row(
            children: [
              const TitleWidget(
                title: 'Time Picker',
              ),
              const SizedBox(width: 16),
              SelectTime(
                onTap: _showTimePicker,
                formattedTime: _formatTime(time),
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomTextField(
            keyboardType: TextInputType.phone,
            hint: ' enter number of phone students',
            onSaved: (value) {
              numberPhoneStudent = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            keyboardType: TextInputType.datetime,
            hint: ' enter date of registration',
            onSaved: (value) {
              date_reg = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hint: "Student's level",
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          // BlocBuilder<GroubAddCubit, GroubAddState>(
          // builder: (context, state) {
          // return
          CustomButton(
            // isLoading: state is GroubAddLoading ? true : false,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                // String currentDate = _formatTime(time).toString();
                // GroubModel groubModel = GroubModel(
                //   nameGroub: nameGroub!,
                //   edLevel: selectedValueLevel!,
                //   day: day!,
                //   timePacker: _formatTime(time),
                //   numberStudent: numberStudent!,
                //   subtitle: subtitle!,
                // );
                // context.read<GroubAddCubit>().addGroub(groubModel);
                print(_formatTime(time));
                print(day);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            // );
            // },
          ),
        ],
      ),
    );
  }
}
