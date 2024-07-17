import 'package:data_table_2/data_table_2.dart';
import 'package:drosak/business_logic_layer/groub/groub_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
// import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroubItemBody extends StatelessWidget {
  const GroubItemBody(
      {super.key, required this.groubModel, required this.index});

  final GroubModel groubModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var data = context.read<GroubCubit>().GroubList;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: size.width,
      height: size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConst.kPrimaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${data?[index].edLevel ?? ''} / ${data?[index].nameGroub ?? ""}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Expanded(
            child: Table(
              groubModel: groubModel,
            ),
          ),
          SizedBox(height: 12),
          Text(
            data?[index].subtitle ?? '',
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
              'Column A',
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
              'number 👨‍💼',
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
            const DataCell(Center(
              child: Text(
                'A',
                style: TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                groubModel.day ?? 'day',
                style: const TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                groubModel.timePacker ?? 'time',
                style: const TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
            DataCell(Center(
              child: Text(
                groubModel.numberStudent ?? 'number studen',
                style: const TextStyle(color: ColorConst.kWhiteColor),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
