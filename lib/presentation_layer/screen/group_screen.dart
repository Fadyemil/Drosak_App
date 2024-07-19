import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/CustomSearchDelegateGroupScreen.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/groub_body.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/groub_botton_sheet.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
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
          text: 'Groub',
          add: () {
            showModalBottomSheet(
              backgroundColor: const Color.fromARGB(255, 16, 112, 124),
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
                  child: const GroubBottonSheet(),
                );
              },
            );
          },
          search: () {
            List<GroubModel>? Data = context.read<GroubCubit>().GroubList;
            setState(() {
              showSearch(
                context: context,
                delegate: CustomSearchDelegateGroupScreen(
                  searchTerms: Data ?? [],
                  scrollController: scrollController,
                ),
              );
            });
          },
        ),
        Expanded(
            child: GroubBody(
          scrollController: scrollController,
        )),
      ],
    ));
  }
}
