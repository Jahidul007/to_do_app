import 'package:flutter/material.dart';
import 'package:to_do_app/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),

    );
  }
}
