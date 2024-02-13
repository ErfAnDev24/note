import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note/Car.dart';
import 'package:note/Student.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');

  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('StudentBox');
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var textEditingController = TextEditingController();
  var intputedText = '';
  var box = Hive.box<Car>('carBox');
  var studentBox = Hive.box<Student>('StudentBox');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  studentBox.delete(1);
                });
              },
              child: Text(
                'delete',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                studentBox.put(
                  1,
                  Student('ErfAn', 'Man', '195cm'),
                );

                studentBox.put(
                  2,
                  Student('Fatemeh', 'Woman', '177cm'),
                );

                setState(() {});
              },
              child: Text(
                'Click for printing',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (studentBox.get(1) == null) {
                  return;
                }

                print(studentBox.get(1)!.name);
                print(studentBox.get(1)!.gender);
                print(studentBox.get(1)!.height);
                print('');
                print(studentBox.get(2)!.name);
                print(studentBox.get(2)!.gender);
                print(studentBox.get(2)!.height);
              },
              child: Text('read'),
            ),
          ]),
        ),
      ),
    );
  }
}
