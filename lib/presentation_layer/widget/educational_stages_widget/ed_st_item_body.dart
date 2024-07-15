import 'package:drosak/business_logic_layer/ed_st/ed_st_cubit.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EdStItemBody extends StatefulWidget {
  const EdStItemBody({super.key, required this.index, required this.edStModel});
  final int index;

  final EdStModel edStModel;

  @override
  State<EdStItemBody> createState() => _EdStItemBodyState();
}

class _EdStItemBodyState extends State<EdStItemBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<EdStModel>? Data = context.read<EdStCubit>().notes;
    return Container(
        margin: EdgeInsets.all(8),
        width: size.width,
        height: size.height * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConst.kPrimaryColor),
        ),
        child: Slidable(
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onPressed: null,
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edid',
                autoClose: true,
              ),
              SizedBox(
                width: 3,
              ),
              SlidableAction(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onPressed: null,
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
              Data?[widget.index].title ?? 'no title',
              style: TextStyle(
                color: ColorConst.kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            subtitle: Text(
              Data?[widget.index].subtitle ?? 'No data',
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
                  onPressed: () {
                    onPressed(context);
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
          ),
        ));
  }

  void onPressed(BuildContext context) {
    widget.edStModel.delete();
    context.read<EdStCubit>().fetchAllEdSt();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text('Delete this is Stage')),
      ),
    );
  }
}
