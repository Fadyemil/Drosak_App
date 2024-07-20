// ignore_for_file: unused_local_variable

// import 'dart:convert';

import 'package:drosak/business_logic_layer/groub_add/groub_add_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/dropdown_field.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/select_time_widget.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/title_widget.dart';
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
  // To get translated educational levels
  List<String> get educationalLevels {
    // Fetch the string from localization
    String data = AppLocalizations.of(context)!.translate('educational_levels');

    // Clean up the string if necessary (e.g., removing surrounding brackets or quotes)
    data = data.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '');

    // Split the string into a list of items
    List<String> levels = data.split(',').map((item) => item.trim()).toList();

    return levels;
  }

  // To get translated days of the week
  List<String> get daysOfWeek {
    String data = AppLocalizations.of(context)!.translate('days_of_week');
    // Clean up the string if necessary (e.g., removing surrounding brackets or quotes)
    data = data.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '');

    // Split the string into a list of items
    List<String> levels = data.split(',').map((item) => item.trim()).toList();

    return levels;
  }

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
      return AppLocalizations.of(context)!.translate('no_time_selected');
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
              hint: AppLocalizations.of(context)!.translate('enter_name_group'),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TitleWidget(
                  title: AppLocalizations.of(context)!
                      .translate('educational_level')),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: AppLocalizations.of(context)!
                        .translate('choose_educational_stage'),
                    items: educationalLevels,
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
              TitleWidget(
                  title: AppLocalizations.of(context)!.translate('day')),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: AppLocalizations.of(context)!.translate('choose_day'),
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
                title: AppLocalizations.of(context)!.translate('time_picker'),
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
            keyboardType: TextInputType.number,
            hint: AppLocalizations.of(context)!
                .translate('enter_number_of_students'),
            onSaved: (value) {
              numberStudent = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hint: AppLocalizations.of(context)!.translate('comments'),
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
                    // String currentDate = _formatTime(time).toString();
                    GroubModel groubModel = GroubModel(
                      nameGroub: nameGroub!,
                      edLevel: selectedValueLevel!,
                      day: day!,
                      timePacker: _formatTime(time),
                      numberStudent: numberStudent!,
                      subtitle: subtitle!,
                    );
                    context.read<GroubAddCubit>().addGroub(groubModel);
                    print(_formatTime(time));
                    print(day);
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
