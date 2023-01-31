

import 'package:flutter/material.dart';
import 'package:navigation/second.dart';
import 'package:navigation/third.dart';

void main() {
  runApp(MaterialApp(
   initialRoute: '/',
    routes:<String, WidgetBuilder> {
     '/':(context)=>RunMyApp(),
      '/second':(context)=>SecondPage(username: null,),
      '/third':(context)=>ThirdPage(),

    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ValueNotifier<String> username = ValueNotifier("-------------");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: username,
          builder: (BuildContext context, value, Widget? child) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "hello ${username.value} !!",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              ElevatedButton(
                  onPressed:(){
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=> SecondPage(username: username))
                    );
                  },
                  child: Text('go to second page'),
              )
            ]);
          },
        ),
      ),
    );
  }
}
