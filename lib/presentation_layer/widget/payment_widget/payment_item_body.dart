// ignore_for_file: unused_local_variable

import 'package:drosak/business_logic_layer/audience/audience_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:drosak/presentation_layer/widget/payment_widget/edit_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Paymentitembody extends StatelessWidget {
  const Paymentitembody(
      {super.key, required this.audMidel, required this.index});
  final AudienceModel audMidel;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var Data = context.read<AudienceCubit>().AudienceList;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: (audMidel.decreasesMoney != null)
            ? Colors.red
            : Colors.blueGrey[500],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConst.kPrimaryColor),
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              onPressed: onPressedEdit,
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edid',
              autoClose: true,
            ),
            SizedBox(width: 3),
            SlidableAction(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              onPressed: onPressedDelete,
              backgroundColor: Color.fromARGB(255, 59, 45, 192),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete',
              autoClose: true,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            audMidel.InputName?.toString() ??
                audMidel.ExpenseName?.toString() ??
                '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            audMidel.numberStudent != null
                ? '''number of Students = ${audMidel.numberStudent}
share price = ${audMidel.sharePrice}\$'''
                : audMidel.subtitle ?? '',
          ),
          trailing: Text(
            'total = \$${audMidel.totalMoney}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void onPressedEdit(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 16, 112, 124),
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
          child: Container(
            // height: size.height * 0.52,
            child: EditPaymentView(
              audienceModel: audMidel,
            ),
          ),
        );
      },
    );
  }

  void onPressedDelete(BuildContext context) {
    audMidel.delete();
    context.read<AudienceCubit>().fetchAllAudience();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Delete this is Stage')),
      ),
    );
  }
}
