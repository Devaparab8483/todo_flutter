import 'package:flutter/material.dart';

class login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: 50,
        
        child: ElevatedButton(onPressed: () { print("Hiio"); },
        child: Text("Hello")),
      ),
    );
  }

}