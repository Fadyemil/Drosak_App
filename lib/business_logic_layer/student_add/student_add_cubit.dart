import 'package:bloc/bloc.dart';
import 'package:drosak/core/const/color_const.dart';
import 'package:drosak/data_layer/models/student_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'student_add_state.dart';

class StudentAddCubit extends Cubit<StudentAddState> {
  StudentAddCubit() : super(StudentAddInitial());

  addStundent(StudentModel stu)async {
    emit(StudentAddLoading());
    try {
      var Student = Hive.box<StudentModel>(KStudentBox);
     await Student.add(stu);
      emit(StudentAddSuccess());
      print(Student.length);
    } catch (e) {
      emit(StudentAddFailure(error: e.toString()));
    }
  }
}
