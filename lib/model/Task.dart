class Task{
  String taskName;
  bool isComplete;

  Task({this.taskName, this.isComplete = false});

  bool toggleDone(){
    isComplete  = !isComplete;
  }
}