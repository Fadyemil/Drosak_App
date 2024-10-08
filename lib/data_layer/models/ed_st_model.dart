// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'ed_st_model.g.dart';

@HiveType(typeId: 0)
class EdStModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  EdStModel({
    required this.title,
    required this.subtitle,
  });
}
