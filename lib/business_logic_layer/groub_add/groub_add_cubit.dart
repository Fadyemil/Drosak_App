import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'groub_add_state.dart';

class GroubAddCubit extends Cubit<GroubAddState> {
  GroubAddCubit() : super(GroubAddInitial());
  addGroub(GroubModel edSt) async {
    emit(GroubLoading());
    try {
      var EdStBox = Hive.box<GroubModel>(KGroubBox);
      await EdStBox.add(edSt);
      emit(GroubSuccess());
      print(EdStBox.length);
    } catch (e) {
      emit(
        GroubFailure(errorMessage: e.toString()),
      );
    }
  }
}
