import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/business_logic_layer/groub_add/groub_add_cubit.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/groub_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroubBottonSheet extends StatelessWidget {
  const GroubBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<GroubAddCubit, GroubAddState>(
      listener: (context, state) {
        if (state is GroubAddFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error ${state.errorMessage}'),
            ),
          );
        }
        if (state is GroubAddLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GroubaddSuccess) {
          context.read<GroubCubit>().fetchAllGroub();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is GroubAddLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(child: GroubForm()),
          ),
        );
      },
    );
  }
}
