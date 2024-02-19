import 'package:hive/hive.dart';
import 'package:note/model/TaskType.dart';

part 'Task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  DateTime? time;

  @HiveField(3, defaultValue: false)
  bool? isDone;

  @HiveField(4)
  TaskType? type;
}
