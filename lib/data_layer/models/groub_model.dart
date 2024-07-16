import 'package:hive/hive.dart';

part 'groub_model.g.dart';
@HiveType(typeId: 1)
class GroubModel  extends HiveObject{
  @HiveField(0)
  String nameGroub;
  @HiveField(1)
  String edLevel;
  @HiveField(2)
  String timePacker;
  @HiveField(3)
  String numberStudent;
  @HiveField(4)
  String subtitle;
  GroubModel({
    required this.nameGroub,
    required this.edLevel,
    required this.timePacker,
    required this.numberStudent,
    required this.subtitle,
  });
}
