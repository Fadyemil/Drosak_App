// ignore_for_file: unused_local_variable

import 'package:drosak/business_logic_layer/ed_st_add/ed_st_add_cubit.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEdStForm extends StatefulWidget {
  const AddEdStForm({super.key});

  @override
  State<AddEdStForm> createState() => _AddEdStFormState();
}

class _AddEdStFormState extends State<AddEdStForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: AppLocalizations.of(context)
                ?.translate('enter_educational_stage'),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: AppLocalizations.of(context)?.translate('comments'),
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<EdStAddCubit, EdStAddState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is EdStAddLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var edStModel =
                        EdStModel(title: title!, subtitle: subTitle!);
                    context.read<EdStAddCubit>().addEdSt(edStModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
