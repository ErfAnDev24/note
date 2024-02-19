import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:note/model/Task.dart';
import 'package:note/model/TaskType.dart';
import 'package:note/model/TypeEnum.dart';

import 'package:note/screen/HomeScreen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(
    Application(),
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
