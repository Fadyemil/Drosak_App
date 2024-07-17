import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/groub_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'groub_add_state.dart';

class GroubAddCubit extends Cubit<GroubAddState> {
  GroubAddCubit() : super(GroubAddInitial());
  addGroub(GroubModel groub) async {
    emit(GroubAddLoading());
    try {
      var EdStBox = Hive.box<GroubModel>(KGroubBox);
      await EdStBox.add(groub);
      emit(GroubaddSuccess());
      print(EdStBox.length);
    } catch (e) {
      emit(
        GroubAddFailure(errorMessage: e.toString()),
      );
    }
  }
}
