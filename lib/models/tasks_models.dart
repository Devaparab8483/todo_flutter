import 'package:hive/hive.dart';
part 'tasks_models.g.dart';


@HiveType(typeId: 0)
class todoTaskModel extends HiveObject{
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String task;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String colorsCell;
  @HiveField(5)
  int ?selectedIndex;
  todoTaskModel({required this.taskTitle, required this.task, required this.date,required this.time,required this.colorsCell, required this.selectedIndex});
}