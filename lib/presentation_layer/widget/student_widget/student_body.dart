import 'package:drosak/business_logic_layer/student/student_cubit.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:drosak/presentation_layer/widget/student_widget/student_Item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBody extends StatefulWidget {
  const StudentBody({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StudentBody> createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<StudentCubit>().fetchAllStudent();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        List<StudentModel>? Data = context.read<StudentCubit>().StudentList;
        if (state is StudentSuccess) {
          return Column(
            children: [
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  controller: widget.scrollController,
                  itemCount: Data?.length ?? 2,
                  itemBuilder: (context, index) {
                    return StudentItemBody(
                      stModel: Data![index],
                    ).animate().fade(
                          delay: Duration(milliseconds: 250),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                  },
                ),
              )
            ],
          );
        } else {
          return const Center(child: Text('Failed to load data'));
        }
      },
    );
  }
}
