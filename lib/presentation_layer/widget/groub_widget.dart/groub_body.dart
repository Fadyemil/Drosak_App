import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget.dart/groub_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroubBody extends StatefulWidget {
  const GroubBody({super.key});

  @override
  State<GroubBody> createState() => _GroubBodyState();
}

class _GroubBodyState extends State<GroubBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroubCubit, GroubState>(
      builder: (context, state) {
        // ignore: unused_local_variable
        List<GroubModel>? Data = context.read<GroubCubit>().GroubList;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GroubItemBody(
                    groubModel: Data![index],
                  ).animate().fade(
                        delay: Duration(milliseconds: 250),
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
