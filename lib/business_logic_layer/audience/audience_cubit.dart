import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/audience_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'audience_state.dart';

class AudienceCubit extends Cubit<AudienceState> {
  AudienceCubit() : super(AudienceInitial());

  List<AudienceModel>? AudienceList;
  fetchAllAudience() {
    var AudienceBox = Hive.box<AudienceModel>(KAudienceBox);
    AudienceList = AudienceBox.values.toList();
    emit(AudienceSucess());
  }
}
