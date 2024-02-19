import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/TaskWidget.dart';
import 'package:note/model/Task.dart';

import 'package:note/screen/AddTaskWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var tastBox = Hive.box<Task>('taskBox');
  bool isVisble = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 201, 201),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ValueListenableBuilder(
          valueListenable: tastBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  setState(() {
                    isVisble = true;
                  });
                }

                if (notification.direction == ScrollDirection.reverse) {
                  setState(() {
                    isVisble = false;
                  });
                }
                return true;
              },
              child: ListView.builder(
                itemCount: tastBox.values.length,
                itemBuilder: (context, index) {
                  return getTaskWidget(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isVisble,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AddTaskWidget();
                },
              ),
            );
          },
          backgroundColor: Color.fromARGB(255, 21, 244, 184),
          child: Image(
            image: AssetImage('images/icon_add.png'),
          ),
        ),
      ),
    );
  }

  Widget getTaskWidget(int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tastBox.deleteAt(index);
      },
      child: TaskWidget(passedTask: tastBox.values.toList()[index]),
    );
  }
}
