// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'groub_model.g.dart';
@HiveType(typeId: 1)
class GroubModel extends HiveObject {
  @HiveField(1)
  String nameGroub;
  @HiveField(2)
  String edLevel;
  @HiveField(3)
  String day;
  @HiveField(4)
  String timePacker;
  @HiveField(5)
  String numberStudent;
  @HiveField(6)
  String subtitle;
  GroubModel({
    required this.nameGroub,
    required this.edLevel,
    required this.day,
    required this.timePacker,
    required this.numberStudent,
    required this.subtitle,
  });
  
}
