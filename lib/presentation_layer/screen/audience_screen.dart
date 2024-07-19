import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_body.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_botton_sheet.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:drosak/presentation_layer/widget/payment_widget/custom_search_delegate_pay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudienceScreen extends StatefulWidget {
  const AudienceScreen({super.key});

  @override
  State<AudienceScreen> createState() => _AudienceScreenState();
}

class _AudienceScreenState extends State<AudienceScreen> {
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
      body: Column(
        children: [
          AppBarApp(
            text: 'Audience',
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
                    child: AudienceBottonSheet(),
                  );
                },
              );
            },
            search: () {
              List<AudienceModel>? Data =
                  context.read<AudienceCubit>().AudienceList;
              setState(() {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegatePay(
                    searchTerms: Data ?? [],
                    scrollController: scrollController,
                  ),
                );
              });
            },
          ),
          Expanded(
            child: AudienceBody(
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
