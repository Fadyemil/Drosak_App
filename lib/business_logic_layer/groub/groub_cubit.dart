import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'groub_state.dart';

class GroubCubit extends Cubit<GroubState> {
  GroubCubit() : super(GroubInitial());
  List<GroubModel>? GroubList;
  fetchAllGroub() {
    var GroubBox = Hive.box<GroubModel>(KGroubBox);
    GroubList = GroubBox.values.toList();
    emit(GroubSucess());
  }
}
