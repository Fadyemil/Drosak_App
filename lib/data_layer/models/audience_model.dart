// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:hive_flutter/hive_flutter.dart';
part 'audience_model.g.dart';
@HiveType(typeId: 3)
class AudienceModel extends HiveObject {
  @HiveField(0)
  String? InputName;
  @HiveField(1)
  String? ExpenseName;
  @HiveField(2)
  String? subtitle;
  @HiveField(3)
  int? totalMoney;
  @HiveField(4)
  int? IncreasesMoney;
  @HiveField(5)
  int? decreasesMoney;
  @HiveField(6)
  int? sharePrice;
  @HiveField(7)
  int? numberStudent;
  AudienceModel({
    this.InputName,
    this.ExpenseName,
    this.subtitle,
    this.totalMoney,
    this.IncreasesMoney,
    this.decreasesMoney,
    this.sharePrice,
    this.numberStudent,
  });
}
