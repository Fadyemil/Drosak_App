// ignore_for_file: unused_local_variable

import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/business_logic_layer/student/student_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/dropdown_field.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/select_time_widget.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/title_widget.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditStudentBody extends StatefulWidget {
  const EditStudentBody({super.key, required this.studentModel});
  final StudentModel studentModel;

  @override
  State<EditStudentBody> createState() => _EditStudentBodyState();
}

class _EditStudentBodyState extends State<EditStudentBody> {
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
    if (widget.studentModel.TimePicker != Null) {
      final time = DateFormat.jm().parse(widget.studentModel.TimePicker);
      this.time = TimeOfDay(hour: time.hour, minute: time.minute);
    }
    selectedValueLevel =
        educationalLevel.contains(widget.studentModel.eductionalLevel)
            ? widget.studentModel.eductionalLevel
            : null;
    day = daysOfWeek.contains(widget.studentModel.day)
        ? widget.studentModel.day
        : null;
    Select_group = groupItems.any((group) => group.nameGroub == widget.studentModel.selectGrouP)
        ? widget.studentModel.selectGrouP
        : null;
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
              onChanged: (value) {
                nameStudent = value;
              },
              initialValue: widget.studentModel.nameStudent,
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
                        widget.studentModel.eductionalLevel =
                            value ?? widget.studentModel.eductionalLevel;
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
                        widget.studentModel.selectGrouP =
                            value ?? widget.studentModel.selectGrouP;
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
                        widget.studentModel.day =
                            value ?? widget.studentModel.day;
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
            initialValue: widget.studentModel.numberPhoneStudent,
            onChanged: (value) {
              numberPhoneStudent = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            keyboardType: TextInputType.datetime,
            initialValue: widget.studentModel.dateRegistration,
            onChanged: (value) {
              date_reg = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            onChanged: (value) {
              subtitle = value;
            },
            initialValue: widget.studentModel.subtitle,
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              widget.studentModel.nameStudent =
                  nameStudent ?? widget.studentModel.nameStudent;
              widget.studentModel.numberPhoneStudent =
                  numberPhoneStudent ?? widget.studentModel.numberPhoneStudent;
              widget.studentModel.dateRegistration =
                  date_reg ?? widget.studentModel.dateRegistration;
              widget.studentModel.subtitle =
                  subtitle ?? widget.studentModel.subtitle;
              widget.studentModel.TimePicker = time != null
                  ? _formatTime(time)
                  : widget.studentModel.TimePicker;
              widget.studentModel.save();
              context.read<StudentCubit>().fetchAllStudent();
              Navigator.pop(context);
            },
            child: Text('done edit'),
          )
        ],
      ),
    );
  }
}
