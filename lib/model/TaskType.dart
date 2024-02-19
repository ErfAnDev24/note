import 'package:hive/hive.dart';

part 'TaskType.g.dart';

@HiveType(typeId: 1)
class TaskType {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? imageAddress;

  @HiveField(2)
  String? type;

  TaskType(this.name, this.imageAddress, this.type);
}
