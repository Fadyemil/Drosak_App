import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/business_logic_layer/audience_add/audience_add_cubit.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudienceBottonSheet extends StatelessWidget {
  const AudienceBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudienceAddCubit, AudienceAddState>(
      listener: (context, state) {
        if (state is AudienceAddSuccess) {
          context.read<AudienceCubit>().fetchAllAudience();
          Navigator.pop(context);
        }
        if (state is AudienceAddFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error ${state.error}'),
            ),
          );
        }
        if (state is AudienceAddLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AudienceAddLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: AudienceForm(),
            ),
          ),
        );
      },
    );
  }
}
