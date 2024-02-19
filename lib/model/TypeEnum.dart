import 'package:hive/hive.dart';

part 'TypeEnum.g.dart';

@HiveType(typeId: 2)
enum TypeEnum {
  @HiveField(0)
  banking,
  @HiveField(1)
  hard_working,
  @HiveField(2)
  meditate,
  @HiveField(3)
  social_friends,
  @HiveField(4)
  work_meeting,
  @HiveField(5)
  workout
}
