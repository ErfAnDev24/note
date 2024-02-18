import 'package:flutter/material.dart';
import 'package:note/TaskWidget.dart';
import 'package:note/screen/AddTaskWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 201, 201),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return getTaskWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }

  Widget getTaskWidget() {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {},
      child: TaskWidget(),
    );
  }
}
