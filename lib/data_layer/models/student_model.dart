import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 2)
class StudentModel extends HiveObject {
  @HiveField(0)
  String nameStudent;
  @HiveField(1)
  String eductionalLevel;
  @HiveField(2)
  String selectGrouP;
  @HiveField(3)
  String day;
  @HiveField(4)
  String TimePicker;
  @HiveField(5)
  String numberPhoneStudent;
  @HiveField(6)
  String dateRegistration;
  @HiveField(7)
  String subtitle;
  StudentModel({
    required this.nameStudent,
    required this.eductionalLevel,
    required this.selectGrouP,
    required this.day,
    required this.TimePicker,
    required this.numberPhoneStudent,
    required this.dateRegistration,
    required this.subtitle,
  });
}
