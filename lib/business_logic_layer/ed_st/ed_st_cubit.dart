import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/ed_st_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'ed_st_state.dart';

class EdStCubit extends Cubit<EdStState> {
  EdStCubit() : super(EdStInitial());

  List<EdStModel>? notes;
  fetchAllEdSt() {
    var EdStBox = Hive.box<EdStModel>(KEdStBox);
    notes = EdStBox.values.toList();
    emit(EdStSucess());
  }
}
