import 'package:get_it/get_it.dart';
import 'package:todoey/provider/TaskProvider.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<TaskProvider>(TaskProvider());
}