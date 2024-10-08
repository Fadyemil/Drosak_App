// ignore_for_file: unused_local_variable

import 'package:drosak/business_logic_layer/audience_add/audience_add_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudienceForm extends StatefulWidget {
  const AudienceForm({super.key});

  @override
  State<AudienceForm> createState() => _AudienceFormState();
}

class _AudienceFormState extends State<AudienceForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? numberStudent, sharePrice, total;
  String? InputName;

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
              keyboardType: TextInputType.name,
              onSaved: (value) {
                InputName = value;
              },
              hint: 'Enter the Input name',
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: CustomTextField(
              keyboardType: TextInputType.number,
              onSaved: (value) {
                numberStudent = int.tryParse(value ?? '');
              },
              hint: 'Enter the number of students',
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: CustomTextField(
              keyboardType: TextInputType.number,
              onSaved: (value) {
                sharePrice = int.tryParse(value ?? '');
              },
              hint: 'Enter the share price',
            ),
          ),
          const SizedBox(height: 15),
          BlocBuilder<AudienceAddCubit, AudienceAddState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AudienceAddLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {
                      total = (numberStudent ?? 0) * (sharePrice ?? 0);
                    });
                    AudienceModel audienceModel = AudienceModel(
                      InputName: InputName,
                      numberStudent: numberStudent,
                      sharePrice: sharePrice,
                      totalMoney: total,
                      IncreasesMoney: total,
                    );
                    context.read<AudienceAddCubit>().addAudience(audienceModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 15),
          Container(
            width: 75,
            height: 45,
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                (total != null) ? "$total" : "N/A",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
