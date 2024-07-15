import 'package:drosak/business_logic_layer/ed_st_add/ed_st_add_cubit.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/add_ed_st_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdStBottmSheet extends StatelessWidget {
  const EdStBottmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EdStAddCubit(),
      child: BlocConsumer<EdStAddCubit, EdStAddState>(
        listener: (context, state) {
          if (state is EdStAddFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error ${state.errorMessage}'),
              ),
            );
          }
          if (state is EdStAddSuccess) {
            // context.read<EdStAddCubit>().addEdSt(edSt)
            Navigator.pop(context);
          }
          if (state is EdStAddLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is EdStAddLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: AddEdStForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
