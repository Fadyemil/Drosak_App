import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'ed_st_add_state.dart';

class EdStAddCubit extends Cubit<EdStAddState> {
  EdStAddCubit() : super(EdStAddInitial());

  addEdSt(EdStModel edSt) async {
    emit(EdStAddLoading());
    try {
      var EdStBox = Hive.box<EdStModel>(KEdStBox);
      await EdStBox.add(edSt);
      emit(EdStAddSuccess());
    } catch (e) {
      emit(
        EdStAddFailure(errorMessage: e.toString()),
      );
    }
  }
}
