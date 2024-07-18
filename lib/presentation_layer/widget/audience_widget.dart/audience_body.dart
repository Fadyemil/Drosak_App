import 'package:drosak/presentation_layer/widget/audience_widget.dart/audience_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AudienceBody extends StatefulWidget {
  const AudienceBody({super.key});
// final ScrollController scrollController;
  @override
  State<AudienceBody> createState() => _AudienceBodyState();
}

class _AudienceBodyState extends State<AudienceBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            // controller: widget.scrollController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return AudienceItemBody(
                      // stModel: Data![index],
                      )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 250),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
            },
          ),
        )
      ],
    );
  }
}
