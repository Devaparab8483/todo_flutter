import 'package:flutter/material.dart';
import 'package:todo/models/tasks_models.dart';
import 'package:todo/pages/add_task.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(todoTaskModelAdapter());
  await Hive.openBox<todoTaskModel>('todo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: addTask(),
    );
  }
}
