import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/TaskProvider.dart';
import 'package:todoey/view/ui/helpers/InputFieldBorder.dart';
import 'package:todoey/view/ui/widgets/RoundedContainer.dart';
import 'package:todoey/GetIt.dart';

class TaskBottomSheet extends StatelessWidget {

  String newTaskTitle;

  //final taskProvider = getIt<TaskProvider>();

  final TextEditingController _text = TextEditingController(); //for validation purposes


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, _){
        return RoundedContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Add a task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                      fontSize: 24.0
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _text,
                  onChanged: (newText) => newTaskTitle = newText,
                  decoration: InputDecoration(
                      focusedBorder: InputFieldBorder().border,
                      enabledBorder: InputFieldBorder().border,
                      errorText: taskProvider.validate?'The value cannot be empty':null
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RaisedButton(
                  child: Text('Add', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    if(_text.text.isEmpty){
                      taskProvider.setValidationStatus(true);
                    } else{
                      taskProvider.setValidationStatus(false);
                      taskProvider.addTask(newTaskTitle);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),

              SizedBox(
                height: 70.0,
              )
            ],
          ),
        );
      },
    );
  }
}
