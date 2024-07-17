// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
// import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/CustomSearchDelegateEdStScreen.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_body.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_bottm_sheet.dart';
// import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_item_body.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class EducationalStages extends StatefulWidget {
  const EducationalStages({super.key});

  @override
  State<EducationalStages> createState() => _EducationalStagesState();
}

class _EducationalStagesState extends State<EducationalStages> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarApp(
            text: 'Educational Stages',
            add: () {
              showModalBottomSheet(
                backgroundColor: Color.fromARGB(255, 16, 112, 124),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: EdStBottmSheet());
                },
              );
            },
            search: () {
              List<EdStModel>? Data = context.read<EdStCubit>().notes;
              setState(() {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegateEdStScreen(
                    searchTerms: Data ?? [],
                    scrollController: scrollController,
                  ),
                );
              });
            },
          ),
          Expanded(child: EdStBody(scrollController: scrollController)),
        ],
      ),
    );
  }
}
