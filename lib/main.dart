import 'package:flutter/material.dart';
import 'package:todo_firebase_new/second_pg.dart';

// import 'First_pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 151, 184, 33)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      
      body: Container(
        // height: 700,
        color: Color.fromARGB(255, 50, 47, 47),
        
        child:Column(
        
        mainAxisAlignment: MainAxisAlignment.start,

        
        
        children: [
          Container(
            height: 70,
            width: 50,

          ),


           Padding(
             padding: const EdgeInsets.all(18.0),
             child: Image.asset("assets/images/clipboard.png"),
           ),

          Container(
            height: 100,
            width: 100,
          ),

           Container(
              child: ElevatedButton(onPressed: (){
                 Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => newPage(),
                ));
              }, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Start",style: TextStyle(fontSize: 20),),
              )),
            ),
          
        ],
        ),

      ),

      
      
      
      );
  }
}
