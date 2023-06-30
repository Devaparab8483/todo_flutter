import 'package:hive/hive.dart';
import 'package:todo/models/tasks_models.dart';

class Boxes{
  static Box<todoTaskModel> getData()=> Hive.box<todoTaskModel>('todo');
}