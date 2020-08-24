import 'package:flutter/material.dart';
import 'package:todoey/view/ui/helpers/InputFieldBorder.dart';
import 'package:todoey/view/ui/widgets/RoundedContainer.dart';

class TaskBottomSheet extends StatefulWidget {

  Function(String) addTaskCallback; //the function for the home screen to manage the list of tasks

  TaskBottomSheet(this.addTaskCallback);

  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  String newTaskTitle;

  final TextEditingController _text = TextEditingController(); //for validation purposes

  bool _validate = false; //does the text need validation? false - no, true - yes

  @override
  Widget build(BuildContext context) {
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
                errorText: _validate?'The value cannot be empty':null
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
                  _text.text.isEmpty?setState((){
                    _validate=true;
                  }):setState((){
                    _validate = false;
                    this.widget.addTaskCallback(this.newTaskTitle);
                  });
                },
              ),
          ),

          SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }
}
