import 'package:flutter/material.dart';
import 'package:todoey/view/ui/screens/to_do_screen/ToDoScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoScreen(),
    );
  }
}
