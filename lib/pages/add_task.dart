import 'package:flutter/material.dart';

import 'new_third.dart';

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
  List<String> title = [
    "Profile",
    "Details",
    "About Us",
    "Help"
  ];
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
                      if (title[index] == "Profile"){
                        print("${title[index]} was hit ");
                      }
                      else if (title[index] == "Details"){
                        print("${title[index]} i.e Details was hit");
                      }
                      else if(title[index] == "About Us"){
                        print("${title[index]}  was hit");
                      }
                      else if(title[index] == "Help"){
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
           onPressed: ()=>Scaffold.of(context).openDrawer(),
          )
        )
      ),
      ),
      bottomNavigationBar:  CircleAvatar(
        radius: 20,
        child: Center(
          child: Builder(
          builder:((context)=> IconButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => taskForm()),
            );
            },
            icon: Icon(Icons.add))
          ),
          )
        ),
      ),  
    );
  }
}
