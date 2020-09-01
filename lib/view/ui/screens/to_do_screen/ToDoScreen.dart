import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/GetIt.dart';
import 'package:todoey/model/Task.dart';
import 'package:todoey/provider/TaskProvider.dart';
import 'package:todoey/view/ui/screens/task_bottom_sheet/TaskBottomSheet.dart';
import 'package:todoey/view/ui/screens/to_do_screen/widgets/ListButton.dart';
import 'package:todoey/view/ui/screens/to_do_screen/widgets/TaskList.dart';
import 'package:todoey/view/ui/widgets/RoundedContainer.dart';


class ToDoScreen extends StatelessWidget {

  //final taskProvider = getIt<TaskProvider>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _){
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
                       taskProvider.tasksCount.toString()+' tasks',
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
                      child: TaskList()
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
                      backgroundColor: Colors.transparent, //for the background elements to be blurred
                      context: context,
                      builder: (context) => SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), //for the keyboard not to overlap the modal window
                          child: TaskBottomSheet()
                      )
                  );
                }
            ),
          ),
        );
      },
    );
  }
}
