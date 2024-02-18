import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/model/Task.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  var focusNodeOne = FocusNode();
  var focusNodeTwo = FocusNode();
  var selectedTaskType = 0;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var newTime = DateTime.now();
  var taskBox = Hive.box<Task>('taskBox');

  @override
  void initState() {
    focusNodeOne.addListener(() {
      setState(() {});
    });
    focusNodeTwo.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  focusNode: focusNodeOne,
                  controller: titleController,
                  cursorColor: Color.fromARGB(255, 20, 225, 181),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    label: Text('title'),
                    labelStyle: focusNodeOne.hasFocus
                        ? TextStyle(
                            color: Color.fromARGB(255, 20, 225, 181),
                          )
                        : TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 20, 225, 181),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  focusNode: focusNodeTwo,
                  controller: descriptionController,
                  cursorColor: Color.fromARGB(255, 20, 225, 181),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    label: Text('description'),
                    labelStyle: focusNodeTwo.hasFocus
                        ? TextStyle(
                            color: Color.fromARGB(255, 20, 225, 181),
                          )
                        : TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 20, 225, 181),
                      ),
                    ),
                  ),
                ),
                CustomHourPicker(
                  title: 'stating time',
                  titleStyle: TextStyle(
                    color: Color.fromARGB(255, 20, 225, 181),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  positiveButtonStyle: TextStyle(
                    color: Color.fromARGB(255, 20, 225, 181),
                  ),
                  negativeButtonStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  elevation: 0.8,
                  positiveButtonText: 'Insert',
                  onPositivePressed: (context, time) {
                    setState(() {
                      newTime = time;
                    });
                  },
                  onNegativePressed: (context) {},
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTaskType = index;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: index == selectedTaskType
                                ? Color.fromARGB(255, 20, 225, 181)
                                : Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image(
                                    image: AssetImage('images/banking.png'),
                                  ),
                                  flex: 8,
                                ),
                                Expanded(
                                  child: Text('Banking',
                                      style: index == selectedTaskType
                                          ? TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : TextStyle()),
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    addTask(titleController.text, descriptionController.text,
                        newTime);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add Task'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color.fromARGB(255, 20, 225, 181),
                      foregroundColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(String newTitle, String newDescription, DateTime newTime) {
    var task = Task();
    task.title = newTitle;
    task.description = newDescription;
    task.time = newTime;
    taskBox.add(task);
  }
}
