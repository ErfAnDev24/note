import 'package:hive_flutter/adapters.dart';

part 'Student.g.dart';

@HiveType(typeId: 2)
class Student {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? gender;

  @HiveField(2)
  String? height;

  Student(this.name, this.gender, this.height);
}
