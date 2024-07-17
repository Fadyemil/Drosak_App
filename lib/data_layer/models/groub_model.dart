// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'groub_model.g.dart';
@HiveType(typeId: 1)
class GroubModel extends HiveObject {
  @HiveField(0)
  String? nameGroub;
  @HiveField(1)
  String? edLevel;
  @HiveField(2)
  String? day;
  @HiveField(3)
  String? timePacker;
  @HiveField(4)
  String? numberStudent;
  @HiveField(5)
  String? subtitle;
  GroubModel({
    required this.nameGroub,
    required this.edLevel,
    required this.day,
    required this.timePacker,
    required this.numberStudent,
    required this.subtitle,
  });
  
}
