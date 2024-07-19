import 'package:drosak/business_logic_layer/audience_add/audience_add_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? expenseAmount, amountSaved, total;
  String? inputName, expenseName, commint;

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
                    },
                    hint: 'Input name',
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
                    },
                    hint: 'Expense name',
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
                    },
                    hint: 'Amount saved',
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
                    },
                    hint: 'Expense amount',
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
              },
              hint: 'commint',
            ),
          ),
          SizedBox(height: 15),
          BlocBuilder<AudienceAddCubit, AudienceAddState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AudienceAddLoading ? true : false,
                onTap: () {
                  setState(() {
                    // total = (numberStudent ?? 0) * (sharePrice ?? 0);
                  });
                  AudienceModel audienceModel = AudienceModel(
                    InputName: inputName,
                    ExpenseName: expenseName,
                    totalMoney: amountSaved ?? expenseAmount,
                    IncreasesMoney: amountSaved,
                    decreasesMoney: expenseAmount,
                    subtitle: commint,
                  );
                  context.read<AudienceAddCubit>().addAudience(audienceModel);
                },
              );
            },
          ),
          const SizedBox(height: 15),
          // Container(
          //   width: 75,
          //   height: 45,
          //   decoration: BoxDecoration(
          //     color: ColorConst.kWhiteColor.withGreen(180),
          //     borderRadius: BorderRadius.circular(14),
          //   ),
          //   child: Center(
          //     child: Text(
          //       (total != null) ? "$total" : "N/A",
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.w800,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
