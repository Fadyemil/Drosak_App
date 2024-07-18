import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AudienceItemBody extends StatelessWidget {
  const AudienceItemBody({super.key, required this.adModel});
  final AudienceModel adModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.blueGrey[600],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConst.kPrimaryColor),
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
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
            const SizedBox(width: 3),
            SlidableAction(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onPressed: onPressedDelete,
              backgroundColor: const Color.fromARGB(255, 59, 45, 192),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete',
              autoClose: true,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            adModel.InputName.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            '''number of Students = ${adModel.numberStudent}
share price = ${adModel.sharePrice}\$
            ''',
          ),
          trailing: Text(
            'total = \$${adModel.totalMoney}',
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
              // child: EditStudentView(
              //   studentModel: stModel,
              // ),
              ),
        );
      },
    );
  }

  void onPressedDelete(BuildContext context) {
    // stModel.delete();
    // context.read<StudentCubit>().fetchAllStudent();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Delete this is Stage')),
      ),
    );
  }
}
