import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
// import 'package:drosak/business_logic_layer/audience_add/audience_add_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_botton.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAudienceBody extends StatefulWidget {
  const EditAudienceBody({super.key, required this.audienceModel});
  final AudienceModel audienceModel;

  @override
  State<EditAudienceBody> createState() => _EditAudienceBodyState();
}

class _EditAudienceBodyState extends State<EditAudienceBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  int? numberStudent, sharePrice, total;
  String? InputName;
  @override
  void initState() {
    super.initState();
    numberStudent = widget.audienceModel.numberStudent;
    sharePrice = widget.audienceModel.sharePrice;
    InputName = widget.audienceModel.InputName;
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
              keyboardType: TextInputType.name,
              onChanged: (value) {
                InputName = value;
                widget.audienceModel.InputName = value;
              },
              initialValue: widget.audienceModel.InputName,
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
              onChanged: (value) {
                numberStudent = int.tryParse(value);
                widget.audienceModel.numberStudent =
                    int.tryParse(value) ?? widget.audienceModel.numberStudent;
              },
              initialValue: widget.audienceModel.numberStudent.toString(),
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
              onChanged: (value) {
                sharePrice = int.tryParse(value);
                widget.audienceModel.sharePrice =
                    int.tryParse(value) ?? widget.audienceModel.sharePrice;
              },
              initialValue: widget.audienceModel.sharePrice.toString(),
            ),
          ),
          const SizedBox(height: 15),
          CustomButton(
            onTap: () {
              widget.audienceModel.InputName =
                  InputName ?? widget.audienceModel.InputName;
              widget.audienceModel.numberStudent =
                  numberStudent ?? widget.audienceModel.numberStudent;
              widget.audienceModel.sharePrice =
                  sharePrice ?? widget.audienceModel.sharePrice;
              widget.audienceModel.save();

              setState(() {
                total = (numberStudent ?? 0) * (sharePrice ?? 0);
              });
              widget.audienceModel.totalMoney = total;
              context.read<AudienceCubit>().fetchAllAudience();
              Navigator.pop(context);
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
                style: const TextStyle(
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
