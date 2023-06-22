import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp( MyApp()); 
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: newPage(),
        
        //home: const newPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class newPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _newPage();
  }
}

class _newPage extends State<newPage>{
  TextEditingController dateinput = TextEditingController(); 
  TextEditingController timeinput = TextEditingController();
  var TaskText =TextEditingController();
  //text editing controller for text field
  
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";//set the initial value of text field
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("TASK FORM"), 
            backgroundColor: const Color.fromARGB(255, 151, 182, 33), //background color of app bar
        ),
        body:Container(
          padding: EdgeInsets.all(20.0),
          
          child:Center( 
            
             child:Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                  Container(
                  height: 10,
                  ),
             
                   TextField(
                  
                  controller: TaskText,
                  decoration: InputDecoration(
                    hintText: "Type your task",
                    labelText: "Type your task",
                    filled: true,              
                     focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 151, 184, 33),
                    width: 2
                  )
                ),
             
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 2,
                  )
                ),
             
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 2,
                  )
                ),
             
                 prefixIcon: Icon(Icons.edit_note,color: Colors.black,)
                  ),
                     
                ),
             
             
             
             
             
                  Container(
                  height: 25,
                  ),
             
                   
                      TextField(
                        controller: dateinput, //editing controller of this TextField
                        decoration: InputDecoration( 
                          filled: true,
                           prefixIcon: Icon(Icons.calendar_month), //icon of text field
                           hintText: "Enter Date",
                           labelText: "Enter Date" ,//label text of field
                          focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 151, 184, 33),
                          width: 2
                        )
                      ),
                   
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        )
                      ),
                   
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        )
                      ),
                   
                   
                        ),
                        readOnly: true,  //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2023), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2024)
                          );
                          
                          if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); 
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement
                   
                              setState(() {
                                 dateinput.text = formattedDate; //set output date to TextField value. 
                              });
                          }else{
                              print("Date is not selected");
                          }
                        },
                     ),
                   
                   Container(
                  height: 25,
                  ),

                  TextField(
                        controller: timeinput, //editing controller of this TextField
                        decoration: InputDecoration( 
                          filled: true,
                           prefixIcon: Icon(Icons.timer), //icon of text field
                           hintText: "Enter Time",
                           labelText: "Enter Time" ,//label text of field
                          focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 151, 184, 33),
                          width: 2
                        )
                      ),
                   
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        )
                      ),
                   
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        )
                      ),
                   
                   
                        ),
                        readOnly: true,  //set it true, so that user will not able to edit text
                         onTap: () async {
                          TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.dial,
                          context: context,
                      );
                  
                  if(pickedTime != null ){
                      print(pickedTime.format(context));   //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                    // //   //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                     print(formattedTime); //output 14:59:00
                    //   //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinput.text = formattedTime; //set the value of text field. 
                      });
                  }else{
                      print("Time is not selected");
                  }
                },
                     ),
                   
             
             
                 ],
               ),
             )
          )
        )
    );
  }
}

