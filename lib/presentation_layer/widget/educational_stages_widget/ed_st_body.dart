import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:drosak/presentation_layer/widget/educational_stages_widget/ed_st_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdStBody extends StatefulWidget {
  const EdStBody({
    super.key,
  });

  @override
  State<EdStBody> createState() => _EdStBodyState();
}

class _EdStBodyState extends State<EdStBody> {
  @override
  void initState() {
    super.initState();
    context.read<EdStCubit>().fetchAllEdSt();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EdStCubit, EdStState>(
      builder: (context, state) {
        List<EdStModel>? Data = context.read<EdStCubit>().notes;
        if (state is EdStSucess) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: Data?.length ?? 2,
                  itemBuilder: (context, index) {
                    return EdStItemBody(
                      index: index,
                      edStModel: Data![index],
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
