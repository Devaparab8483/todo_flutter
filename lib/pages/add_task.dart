import 'package:flutter/material.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            Container(
              height: 80, // Set the desired height of the container
              color: Colors.blue,
              child: Align(
                alignment: Alignment.topLeft,
                child: Center(
                  child: Text(
                    'Centered Text',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              onPressed: (){
              print("hello");
            }, icon: Icon(Icons.person)),
            Text("Profile"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              onPressed: (){
              print("hello");
            }, icon: Icon(Icons.edit_note)),
            Text("Details"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              onPressed: (){
              print("hello");
            }, icon: Icon(Icons.three_p)),
            Text("About Us"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              onPressed: (){
              print("hello");
            }, icon: Icon(Icons.info)),
            Text("Help"),
              ],
            ),
            
            // SizedBox(
            //   height: 25,
            // ),
            // Text("Details"),
            // SizedBox(
            //   height: 25,
            // ),
            // Text("About Us"),
            // SizedBox(
            //   height: 25,
            // ),
            // Text("Help"),
            
          ]),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('My App'),
        // Add the leading icon/button to open the drawer
        leading: Builder(
          builder: ((context) => IconButton(
           icon: Icon(Icons.menu),
           onPressed: ()=>Scaffold.of(context).openDrawer(),
          )
        )
      ),
      )  
    );
  }
}