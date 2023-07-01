import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/boxes/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/view_task.dart';
import '../models/tasks_models.dart';
import 'new_third.dart';
import 'update_task.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  List<IconData> icons = [
    Icons.person,
    Icons.edit_note,
    Icons.three_p,
    Icons.info
  ];
  List<String> title = ["Profile", "Details", "About Us", "Help"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: Column(children: [
          Container(
            height: 80, // Set the desired height of the container
            color: Colors.blue,
            child: Align(
              alignment: Alignment.topLeft,
              child: Center(
                child: Text(
                  "Todo App",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(icons[index]), // Icon from the icons list
                  title: Text(title[index]), // Title from the titles list
                  onTap: () {
                    if (title[index] == "Profile") {
                      print("${title[index]} was hit ");
                    } else if (title[index] == "Details") {
                      print("${title[index]} i.e Details was hit");
                    } else if (title[index] == "About Us") {
                      print("${title[index]}  was hit");
                    } else if (title[index] == "Help") {
                      print("${title[index]}  was hit");
                    }
                  },
                );
              },
            ),
          ),
        ]),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
        // Add the leading icon/button to open the drawer
        leading: Builder(
            builder: ((context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ))),
      ),
      body: ValueListenableBuilder<Box<todoTaskModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<todoTaskModel>();
            return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => display(
                                taskModel: data[index],
                                taskTitle: data[index].taskTitle.toString(),
                                task: data[index].task.toString(),
                                date: data[index].date.toString(),
                                time: data[index].time.toString(),
                                colorsCell: data[index].colorsCell.toString(),
                                selectedIndex: data[index].selectedIndex!)),
                      );
                    },
                    child: Container(
                      height: 80,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(data[index].taskTitle.toString()),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        delete(data[index]);
                                      },
                                      child: Icon(
                                        Icons.delete_forever_rounded,
                                        color: Colors.red,
                                      )),
                                  SizedBox(width: 15),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => updateTask(
                                                  taskModel: data[index],
                                                  taskTitle: data[index]
                                                      .taskTitle
                                                      .toString(),
                                                  task: data[index]
                                                      .task
                                                      .toString(),
                                                  date: data[index]
                                                      .date
                                                      .toString(),
                                                  time: data[index]
                                                      .time
                                                      .toString(),
                                                  colorsCell: data[index]
                                                      .colorsCell
                                                      .toString(),
                                                  selectedIndex: data[index]
                                                      .selectedIndex!)),
                                        );
                                      },
                                      // onTap:(){ updateTask(taskModel: data[index],taskTitle: data[index].taskTitle.toString(),task: data[index].task.toString(),date: data[index].date.toString(),time: data[index].time.toString(),colorsCell: data[index].colorsCell.toString(),selectedIndex: data[index].selectedIndex!);},
                                      child: Icon(Icons.edit)),
                                ],
                              ),
                              Text(data[index].task.toString()),
                              Text(data[index].time.toString()),
                              Text(data[index].selectedIndex.toString())
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
      bottomNavigationBar: CircleAvatar(
        radius: 20,
        child: Center(
            child: Builder(
          builder: ((context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => taskForm()),
                );
              },
              icon: Icon(Icons.add))),
        )),
      ),
    );
  }

  void delete(todoTaskModel taskModel) async {
    await taskModel.delete();
  }
}
