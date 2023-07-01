import 'package:flutter/material.dart';

import '../models/tasks_models.dart';

class display extends StatefulWidget {
  final todoTaskModel taskModel;

  const display(
      {super.key,
      required this.taskModel,
      required this.taskTitle,
      required this.task,
      required this.date,
      required this.time,
      required this.colorsCell,
      required this.selectedIndex});
  final int selectedIndex;
  final String task;
  final String date;
  final String time;
  final String colorsCell;
  final String taskTitle;
  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.task,
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Text("ON :- " + widget.date),
          Text("AT:- " + widget.time),
          Text("Priority:- " + widget.colorsCell),
        ],
      ),
    );
  }
}
