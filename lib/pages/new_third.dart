import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:todo/models/tasks_models.dart';
import 'package:todo/boxes/boxes.dart';


class taskForm extends StatefulWidget {
  const taskForm({super.key});

  @override
  State<taskForm> createState() => _taskFormState();
}

class _taskFormState extends State<taskForm> {
  int selectedIndex = 0;
  TextEditingController titleinput = TextEditingController(); 
  TextEditingController dateinput = TextEditingController(); 
  TextEditingController timeinput = TextEditingController();
  var TaskText =TextEditingController();
  String? ColorsCell;
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
        title: Text("Todo Task Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding( 
              padding: const EdgeInsets.all(20.0),
              child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                     
                TextField(          
                  controller: titleinput,
                  decoration: InputDecoration(
                    hintText: "Type your task title",
                    labelText: "Type your task title",
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
                SizedBox(
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
                SizedBox(
                  height: 10,
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
                      SizedBox(
                        height: 35,
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
                              print("hello");
                              print(pickedTime.format(context));   //output 10:51 PM
                              // DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                            // //   //converting to DateTime so that we can further format on different pattern.
                              // print(parsedTime); //output 1970-01-01 22:53:00.000
                              // String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                            //  print(formattedTime); //output 14:59:00
                            //   //DateFormat() is from intl package, you can format the time on any pattern you need.
            
                              setState(() {
                                timeinput.text = pickedTime.format(context); //set the value of text field. 
                              });
                          }else{
                              print("Time is not selected");
                          }
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Choose your task categories:",style: TextStyle(fontSize: 20),),
            
                          Divider(),
            
                        
                              RadioListTile(
                                  title: Text("Important"),
                                  value: "imp", 
                                  groupValue: ColorsCell, 
                                  onChanged: (value){
                                    setState(() {
                                        ColorsCell = value.toString();
                                    });
                                  },
                              ),
                        
                               RadioListTile(
                              title: Text("Regular"),
                              value: "reg", 
                              groupValue: ColorsCell, 
                              onChanged: (value){
                                setState(() {
                                    ColorsCell = value.toString();
                                });
                              },
                          ),
                        
                          
            
                          Divider(),
                          SizedBox(height: 10,),
                      ])),
                      Text("Task Color:",style: TextStyle(fontSize: 20),),
            
                          ToggleSwitch(
                            labels: [
                              "Red",
                              "yellow",
                              "green",
                            ],
                            fontSize: 20,
                            cornerRadius: 20,
                            minHeight: 70,
                            minWidth: 100,
            
                            activeBgColors:[
                              [Colors.red],
                             [ Colors.yellow],
                             [ Colors.green],
            
                         ],
                         initialLabelIndex: selectedIndex,
                          onToggle: (index) {
                            setState(() {
                              selectedIndex = index!;
                            });
                          },
                          ),
                          SizedBox(height:30),
            
                          Container( 
            
                             child: ElevatedButton(onPressed: 
                             (){
                                final data = todoTaskModel(
                                  taskTitle: titleinput.text, 
                                  task: TaskText.text,
                                  date: dateinput.text,
                                  time: timeinput.text,
                                  colorsCell: ColorsCell.toString(),
                                  selectedIndex: selectedIndex,
                                );
                                final box = Boxes.getData();
                                box.add(data);
                                data.save();
                                titleinput.clear();
                                TaskText.clear();
                                dateinput.clear();
                                timeinput.clear();
                                selectedIndex = 0;
                                setState(() {
                                  ColorsCell = '';
                                  selectedIndex = 0;
                                });
                             }, child: Text('Save',style: TextStyle(fontSize: 20,)),)
                             ),
          ]),
      ),
    );
  }
}