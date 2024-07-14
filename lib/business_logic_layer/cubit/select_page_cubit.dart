import 'package:drosak/business_logic_layer/cubit/select_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPageCubit extends Cubit<SelectPageState> {
  SelectPageCubit() : super(SelectPageState(index: 0));

  void chage({required int index}) {
    emit(SelectPageInitial(index: index));
  }
}
