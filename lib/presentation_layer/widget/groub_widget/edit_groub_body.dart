import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/dropdown_field.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/select_time_widget.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/title_widget.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditGroubBody extends StatefulWidget {
  const EditGroubBody({super.key, required this.groubModel});
  final GroubModel groubModel;

  @override
  State<EditGroubBody> createState() => _EditGroubBodyState();
}

class _EditGroubBodyState extends State<EditGroubBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  List<String> educationalLevel = [];
  List<String> daysOfWeek = [];

  String? ed_Level, day, nameGroub, subtitle, numberStudent;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TimeOfDay? time;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    educationalLevel = _getTranslatedEducationalLevels();
    daysOfWeek = _getTranslatedDaysOfWeek();

    day = daysOfWeek.contains(widget.groubModel.day) ? widget.groubModel.day : null;
    ed_Level = educationalLevel.contains(widget.groubModel.edLevel) ? widget.groubModel.edLevel : null;

    if (widget.groubModel.timePacker != null) {
      try {
        final time = DateFormat.jm().parse(widget.groubModel.timePacker ?? '');
        this.time = TimeOfDay(hour: time.hour, minute: time.minute);
      } catch (e) {
        print('Error parsing time: $e');
        this.time = null; // Handle or set a default value if parsing fails
      }
    }
  }

  List<String> _getTranslatedEducationalLevels() {
    String data = AppLocalizations.of(context)!.translate('educational_levels');
    data = data.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '');
    return data.split(',').map((item) => item.trim()).toList();
  }

  List<String> _getTranslatedDaysOfWeek() {
    String data = AppLocalizations.of(context)!.translate('days_of_week');
    data = data.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '');
    return data.split(',').map((item) => item.trim()).toList();
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: time ?? TimeOfDay.now(),
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
    final format = MediaQuery.of(context).alwaysUse24HourFormat ? 'HH:mm' : 'h:mm a';
    return DateFormat(format).format(dt);
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
              onChanged: (value) {
                nameGroub = value;
              },
              initialValue: widget.groubModel.nameGroub,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TitleWidget(title: AppLocalizations.of(context)!.translate('educational_level')),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: DropdownField(
                    hint: AppLocalizations.of(context)!.translate('choose_educational_stage'),
                    items: educationalLevel,
                    selectedValue: ed_Level,
                    onChanged: (value) {
                      setState(() {
                        ed_Level = value;
                        widget.groubModel.edLevel = value ?? widget.groubModel.edLevel;
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
              TitleWidget(title: AppLocalizations.of(context)!.translate('day')),
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
                        widget.groubModel.day = value ?? widget.groubModel.day;
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
            onChanged: (value) {
              numberStudent = value;
            },
            initialValue: widget.groubModel.numberStudent,
          ),
          SizedBox(height: 15),
          CustomTextField(
            onChanged: (value) {
              subtitle = value;
            },
            initialValue: widget.groubModel.subtitle,
            maxLines: 4,
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              widget.groubModel.nameGroub = nameGroub ?? widget.groubModel.nameGroub;
              widget.groubModel.subtitle = subtitle ?? widget.groubModel.subtitle;
              widget.groubModel.numberStudent = numberStudent ?? widget.groubModel.numberStudent;
              widget.groubModel.timePacker = time != null
                  ? _formatTime(time)
                  : widget.groubModel.timePacker;

              widget.groubModel.save();
              BlocProvider.of<GroubCubit>(context).fetchAllGroub();
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.translate('done_edit')),
          )
        ],
      ),
    );
  }
}
