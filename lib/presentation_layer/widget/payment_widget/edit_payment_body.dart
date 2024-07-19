import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPaymentBody extends StatefulWidget {
  const EditPaymentBody({super.key, required this.audienceModel});
  final AudienceModel audienceModel;

  @override
  State<EditPaymentBody> createState() => _EditPaymentBodyState();
}

class _EditPaymentBodyState extends State<EditPaymentBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? expenseAmount, amountSaved, total;
  String? inputName, expenseName, commint;
  @override
  void initState() {
    super.initState();
    inputName = widget.audienceModel.InputName;
    expenseName = widget.audienceModel.ExpenseName;
    commint = widget.audienceModel.subtitle;
    expenseAmount = widget.audienceModel.decreasesMoney;
    amountSaved = widget.audienceModel.IncreasesMoney;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.kWhiteColor.withGreen(180),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CustomTextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      inputName = value;
                      widget.audienceModel.InputName = value;
                    },
                    initialValue: widget.audienceModel.InputName,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.kWhiteColor.withGreen(180),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CustomTextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      expenseName = value;
                      widget.audienceModel.ExpenseName = value;
                    },
                    initialValue: widget.audienceModel.ExpenseName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.kWhiteColor.withGreen(180),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      amountSaved = int.tryParse(value);
                      widget.audienceModel.IncreasesMoney =
                          int.tryParse(value) ??
                              widget.audienceModel.IncreasesMoney;
                    },
                    initialValue:
                        widget.audienceModel.IncreasesMoney.toString(),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.kWhiteColor.withGreen(180),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      expenseAmount = int.tryParse(value);
                      widget.audienceModel.decreasesMoney =
                          int.tryParse(value) ??
                              widget.audienceModel.decreasesMoney;
                    },
                    initialValue:
                        widget.audienceModel.decreasesMoney.toString(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.kWhiteColor.withGreen(180),
              borderRadius: BorderRadius.circular(14),
            ),
            child: CustomTextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                commint = (value);
                widget.audienceModel.subtitle = value;
              },
              initialValue: widget.audienceModel.subtitle,
            ),
          ),
          SizedBox(height: 15),
          CustomButton(
            onTap: () {
              setState(() {
                // total = (numberStudent ?? 0) * (sharePrice ?? 0);
              });
              widget.audienceModel.InputName =
                  inputName ?? widget.audienceModel.InputName;
              widget.audienceModel.ExpenseName =
                  expenseName ?? widget.audienceModel.ExpenseName;
              widget.audienceModel.decreasesMoney =
                  expenseAmount ?? widget.audienceModel.decreasesMoney;
              widget.audienceModel.IncreasesMoney =
                  amountSaved ?? widget.audienceModel.IncreasesMoney;
              widget.audienceModel.subtitle =
                  commint ?? widget.audienceModel.subtitle;
              widget.audienceModel.totalMoney = amountSaved ?? expenseAmount;
              context.read<AudienceCubit>().fetchAllAudience();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
