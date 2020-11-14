import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider%20/task_data.dart';
import 'package:to_do_app/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
