import 'package:data_table_2/data_table_2.dart';
import 'package:drosak/business_logic_layer/cubit/app_theme_cubit.dart';
import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:drosak/presentation_layer/widget/groub_widget/edit_groub_view.dart';
// import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroubItemBody extends StatelessWidget {
  const GroubItemBody(
      {super.key, required this.groubModel, required this.index});

  final GroubModel groubModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<AppThemeCubit>().state;
    bool isDarkMode = themeState is DarkCubit;
    Size size = MediaQuery.sizeOf(context);
    var data = context.read<GroubCubit>().GroubList;
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
            Text(
              "${data?[index].edLevel ?? ''} / ${data?[index].nameGroub ?? ""}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Table(
                groubModel: groubModel,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              data?[index].subtitle ?? '',
              textScaler: const TextScaler.linear(1),
              softWrap: false,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:
                    isDarkMode ? Colors.white.withOpacity(0.5) : Colors.black87,
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
            child: EditGroubView(
              groubModel: groubModel,
            ),
          ),
        );
      },
    );
  }

  void onPressedDelete(BuildContext context) {
    groubModel.delete();
    context.read<GroubCubit>().fetchAllGroub();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Delete this is Stage')),
      ),
    );
  }
}

class Table extends StatelessWidget {
  const Table({
    super.key,
    required this.groubModel,
  });
  final GroubModel groubModel;

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<AppThemeCubit>().state;
    bool isDarkMode = themeState is DarkCubit;
    return DataTable2(
      border: TableBorder.all(
        width: 1,
        color: isDarkMode ? Colors.white : Colors.black,
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
        (index) => DataRow(
          cells: [
            DataCell(Center(
              child: Text(
                groubModel.numberStudent ?? 'number studen',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            )),
            DataCell(Center(
              child: Text(
                groubModel.day ?? 'day',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            )),
            DataCell(Center(
              child: Text(
                groubModel.timePacker ?? 'time',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            )),
            const DataCell(Center(
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
