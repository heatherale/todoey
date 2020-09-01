import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/TaskProvider.dart';
import 'package:todoey/view/ui/screens/to_do_screen/ToDoScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: ToDoScreen(),
      ),
    );
  }
}
