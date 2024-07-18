import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'audience_add_state.dart';

class AudienceAddCubit extends Cubit<AudienceAddState> {
  AudienceAddCubit() : super(AudienceAddInitial());

  addAudience(AudienceModel adModel) async {
    try {
      var AdBox = Hive.box<AudienceModel>(KAudienceBox);
      await AdBox.add(adModel);
      emit(AudienceAddSuccess());
      print(AdBox.length);
    } catch (e) {
      emit(AudienceAddFailure(error: e.toString()));
    }
  }
}
