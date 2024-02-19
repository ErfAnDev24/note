import 'package:note/model/TaskType.dart';
import 'package:note/model/TypeEnum.dart';

List<TaskType> getTaskTypes() {
  List<TaskType> types = [
    TaskType('Banking', 'images/banking.png', TypeEnum.banking.toString()),
    TaskType('Hard Working', 'images/hard_working.png',
        TypeEnum.hard_working.toString()),
    TaskType('Meditate', 'images/meditate.png', TypeEnum.meditate.toString()),
    TaskType('Social', 'images/social_friends.png',
        TypeEnum.social_friends.toString()),
    TaskType('Work Meeting', 'images/work_meeting.png',
        TypeEnum.work_meeting.toString()),
    TaskType('Workout', 'images/workout.png', TypeEnum.workout.toString()),
  ];

  return types;
}
