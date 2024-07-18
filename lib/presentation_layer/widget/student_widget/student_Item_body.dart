import 'package:data_table_2/data_table_2.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StudentItemBody extends StatelessWidget {
  const StudentItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: size.width,
      height: size.height * 0.35,
      decoration: BoxDecoration(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              // "${data?[index].edLevel ?? ''} / ${data?[index].nameGroub ?? ""}",
              'name Student',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              // "${data?[index].edLevel ?? ''} / ${data?[index].nameGroub ?? ""}",
              'صف الاول الاعدادي /   المجموعة الأولي',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: StudentTable(
                  // groubModel: groubModel,
                  ),
            ),
            Center(
              child: const Text(
                // "${data?[index].edLevel ?? ''} / ${data?[index].nameGroub ?? ""}",
                '🤙 011533348583',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              // data?[index].subtitle ??
              "Student's level",
              textScaler: const TextScaler.linear(1),
              softWrap: false,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorConst.kWhiteColor.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
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
            child: Container(child: Text('data')),
            // EditGroubView(
            //   groubModel: groubModel,
            // ),
          ),
        );
      },
    );
  }

  void onPressedDelete(BuildContext context) {
    // groubModel.delete();
    // context.read<GroubCubit>().fetchAllGroub();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Delete this is Stage')),
      ),
    );
  }
}

class StudentTable extends StatelessWidget {
  const StudentTable({
    super.key,
    // required this.groubModel,
  });
  // final GroubModel groubModel;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      border: TableBorder.all(
        width: 1,
        color: Colors.white,
      ),
      columnSpacing: 4,
      horizontalMargin: 12,
      minWidth: 200,
      dividerThickness: 2.5,
      columns: const [
        DataColumn2(
          label: Center(
            child: Text(
              'number 👨‍💼',
              style: TextStyle(color: ColorConst.kPrimaryColor),
            ),
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Center(
            child: Text(
              'Day',
              style: TextStyle(color: ColorConst.kPrimaryColor),
            ),
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Center(
            child: Text(
              'time',
              style: TextStyle(color: ColorConst.kPrimaryColor),
            ),
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Center(
            child: Text(
              'Group time 📗',
              style: TextStyle(color: ColorConst.kPrimaryColor),
            ),
          ),
          size: ColumnSize.S,
        ),
      ],
      rows: List<DataRow>.generate(
        1,
        (index) => const DataRow(
          cells: [
            DataCell(Center(
              child: Text(
                // groubModel.numberStudent ??
                'number studen',
                style: TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                // groubModel.day ??
                'day',
                style: TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                // groubModel.timePacker ??
                'time',
                style: TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                '👈 👈',
                style: TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
