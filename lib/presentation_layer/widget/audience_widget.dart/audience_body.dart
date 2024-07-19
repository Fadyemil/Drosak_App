import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudienceBody extends StatefulWidget {
  const AudienceBody({super.key});
// final ScrollController scrollController;
  @override
  State<AudienceBody> createState() => _AudienceBodyState();
}

class _AudienceBodyState extends State<AudienceBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AudienceCubit>().fetchAllAudience();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudienceCubit, AudienceState>(
      builder: (context, state) {
        List<AudienceModel>? Data = context.read<AudienceCubit>().AudienceList;
        return Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                // controller: widget.scrollController,
                itemCount: Data?.length ?? 0,
                itemBuilder: (context, index) {
                  if (Data?[index].numberStudent != null) {
                    return AudienceItemBody(
                      adModel: Data![index],
                    ).animate().fade(
                          delay: Duration(milliseconds: 250),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                  }
                  return SizedBox.shrink();
                },
              ),
            )
          ],
        );
      },
    );
  }
}
