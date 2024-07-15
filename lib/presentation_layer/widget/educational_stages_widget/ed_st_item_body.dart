import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdStItemBody extends StatelessWidget {
  const EdStItemBody({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<EdStModel>? Data = context.read<EdStCubit>().notes;
    return Container(
        // padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        width: size.width,
        height: size.height * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConst.kPrimaryColor),
        ),
        child: ListTile(
          title: Text(
            Data?[index].title ?? 'no title',
            style: TextStyle(
              color: ColorConst.kWhiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          subtitle: Text(
            Data?[index].subtitle ?? 'No data',
            textScaler: const TextScaler.linear(1),
            softWrap: false,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorConst.kWhiteColor.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ));
  }
}
