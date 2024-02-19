import 'package:flutter/material.dart';
import 'package:note/model/Task.dart';

import 'package:note/screen/EditTaskWidget.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.passedTask});

  Task? passedTask;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTaskDone = false;
  Task? task;

  @override
  void initState() {
    task = widget.passedTask;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          Positioned(
                            left: 52,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${task?.title}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 20, 225, 181),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    '${task?.description}',
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Transform.scale(
                              scale: 1.4,
                              child: Checkbox(
                                activeColor: Color.fromARGB(255, 20, 225, 181),
                                value: isTaskDone,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      isTaskDone = !isTaskDone;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 20, 225, 181),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${getTimeUnderZero(task!)}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 6),
                                    width: 20,
                                    height: 20,
                                    child: Image(
                                      image: AssetImage('images/icon_time.png'),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EditTaskWidget();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 210, 225, 222),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 225, 181),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 6),
                                      width: 20,
                                      height: 20,
                                      child: Image(
                                        image:
                                            AssetImage('images/icon_edit.png'),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flex: 7,
          ),
          Expanded(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/banking.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  String getTimeUnderZero(Task task) {
    DateTime? time = task.time;
    int hour = time!.hour;
    int minutes = time.minute;

    String finalHour = hour.toString();
    String finalMinutes = minutes.toString();

    if (hour < 10) {
      finalHour = '0' + finalHour;
    }

    if (minutes < 10) {
      finalMinutes = '0' + finalMinutes;
    }

    return '${finalHour}:${finalMinutes}';
  }
}
