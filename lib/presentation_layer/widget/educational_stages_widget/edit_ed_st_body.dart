import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/data_layer/helper/appLocalizations.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
// import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:drosak/presentation_layer/widget/show_mode_botton_sheet/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEdStBody extends StatefulWidget {
  const EditEdStBody({Key? key, required this.edStModel}) : super(key: key);

  final EdStModel edStModel;

  @override
  State<EditEdStBody> createState() => _EditEdStBodyState();
}

class _EditEdStBodyState extends State<EditEdStBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: EditEDSTbodyColumn(
        edStModel: widget.edStModel,
      ),
    );
  }
}

class EditEDSTbodyColumn extends StatefulWidget {
  const EditEDSTbodyColumn({super.key, required this.edStModel});
  final EdStModel edStModel;

  @override
  State<EditEDSTbodyColumn> createState() => _EditEDSTbodyColumnState();
}

class _EditEDSTbodyColumnState extends State<EditEDSTbodyColumn> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomTextField(
            initialValue: widget.edStModel.title,
            onChanged: (value) {
              title = value;
            },
            hint: widget.edStModel.title,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            initialValue: widget.edStModel.subtitle,
            onChanged: (value) {
              content = value;
            },
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.edStModel.title = title ?? widget.edStModel.title;
              widget.edStModel.subtitle = content ?? widget.edStModel.subtitle;
              widget.edStModel.save();
              BlocProvider.of<EdStCubit>(context).fetchAllEdSt();
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)?.translate("done_edit") ?? '',
            ),
          )
        ],
      ),
    );
  }
}
