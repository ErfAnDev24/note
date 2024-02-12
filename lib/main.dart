import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
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
  var box = Hive.box('names');

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
                  box.delete(1);
                });
              },
              child: Text(
                'delete',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  box.put(1, textEditingController.text);
                });
              },
              child: Text(
                'Click for printing',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              box.get(1) ?? 'empty',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ]),
        ),
      ),
    );
  }
}
