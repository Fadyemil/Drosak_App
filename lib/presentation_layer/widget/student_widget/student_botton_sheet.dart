import 'package:drosak/business_logic_layer/student/student_cubit.dart';
import 'package:drosak/business_logic_layer/student_add/student_add_cubit.dart';
import 'package:drosak/presentation_layer/widget/student_widget/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBottonSheet extends StatelessWidget {
  const StudentBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentAddCubit, StudentAddState>(
      listener: (context, state) {
        if (state is StudentAddLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is StudentAddSuccess) {
          context.read<StudentCubit>().fetchAllStudent();
          Navigator.pop(context);
        }
        if (state is StudentAddFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error ${state.error}'),
            ),
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is StudentAddLoading ? true : false,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.85,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: StudentForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
