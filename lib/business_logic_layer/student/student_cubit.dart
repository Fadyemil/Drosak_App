import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  List<StudentModel>? StudentList;
  fetchAllStudent() {
    var StudentBox = Hive.box<StudentModel>(KStudentBox);
    StudentList = StudentBox.values.toList();
    emit(StudentSuccess());
  }
}
