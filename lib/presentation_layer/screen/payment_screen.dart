import 'package:drosak/presentation_layer/widget/home_widget/app_bar.dart';
import 'package:drosak/presentation_layer/widget/payment_widget/payment_body.dart';
import 'package:drosak/presentation_layer/widget/payment_widget/payment_botton_sheet.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarApp(
          text: 'Payment',
          add: () {
            showModalBottomSheet(
              backgroundColor: Color.fromARGB(255, 16, 112, 124),
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: PaymentBottonSheet(),
                );
              },
            );
          },
        ),
        Expanded(
          child: PaymentBody(),
        ),
      ],
    );
  }
}
