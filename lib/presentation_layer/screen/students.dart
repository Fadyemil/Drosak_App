import 'package:drosak/business_logic_layer/student/student_cubit.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:drosak/presentation_layer/widget/student_widget/custom_search_delegate_student_Screen.dart';
import 'package:drosak/presentation_layer/widget/student_widget/student_body.dart';
import 'package:drosak/presentation_layer/widget/student_widget/student_botton_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
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
            text: 'Student',
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
                    child: StudentBottonSheet(),
                  );
                },
              );
            },
            search: () {
              List<StudentModel>? Data =
                  context.read<StudentCubit>().StudentList;
              setState(() {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegateStudentScreen(
                    searchTerms: Data ?? [],
                    scrollController: scrollController,
                  ),
                );
              });
            },
          ),
          Expanded(
              child: StudentBody(
            scrollController: scrollController,
          ))
        ],
      ),
    );
  }
}
