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
            return TaskWidget();
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
}


/*Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 20, 176, 142),
          ),
          child: Transform.scale(
            scale: 1.4,
            child: Image(
              image: AssetImage('images/icon_add.png'),
            ),
          ),
        ),
      ),*/