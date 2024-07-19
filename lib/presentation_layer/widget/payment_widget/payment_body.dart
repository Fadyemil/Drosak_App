import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
// import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/payment_widget/payment_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
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
            SohwMany(),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                controller: widget.scrollController,
                itemCount: Data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Paymentitembody(
                    audMidel: Data![index],
                    index: index,
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
      },
    );
  }
}

class SohwMany extends StatelessWidget {
  const SohwMany({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var data = context.read<AudienceCubit>().AudienceList;

    int totalIncreasesMoney = data?.fold<int>(0, (sum, item) {
          return sum + (item.IncreasesMoney ?? 0);
        }) ??
        0;

    int totalDecreasesMoney = data?.fold<int>(0, (sum, item) {
          return sum + (item.decreasesMoney ?? 0);
        }) ??
        0;

    return Container(
      width: size.width * 0.8, // Adjusted width for better alignment
      height: size.height * 0.14, // Increased height for better spacing
      padding: EdgeInsets.all(16), // Added padding
      decoration: BoxDecoration(
        color: Color.fromARGB(156, 191, 8, 185),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total Revenue Increase: \$${totalIncreasesMoney.toString()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8), // Increased spacing
          Text(
            "Total Financial Loss: \$${totalDecreasesMoney.toString()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
