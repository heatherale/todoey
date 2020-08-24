import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';
import 'package:todoey/view/ui/screens/task_bottom_sheet/TaskBottomSheet.dart';
import 'package:todoey/view/ui/screens/to_do_screen/widgets/ListButton.dart';
import 'package:todoey/view/ui/screens/to_do_screen/widgets/TaskList.dart';
import 'package:todoey/view/ui/screens/to_do_screen/widgets/TaskListTile.dart';
import 'package:todoey/view/ui/widgets/RoundedContainer.dart';


class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {

  List<Task> tasks = [
    Task(taskName: 'Buy milk'),
    Task(taskName: 'Buy eggs'),
    Task(taskName: 'Buy cat food'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListButton(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    tasks.length.toString()+' tasks',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: RoundedContainer(
                child: TaskList(this.tasks)
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled:true,
              backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TaskBottomSheet((String newTaskTitle){
                      setState(() {
                        tasks.add(Task(taskName: newTaskTitle));
                      });
                      Navigator.pop(context);
                    })));
          },
        ),
      ),
    );
  }
}
