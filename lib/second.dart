import 'package:flutter/material.dart';
import 'package:navigation/third.dart';

class SecondPage extends StatelessWidget {

  ValueNotifier<String>? username;
  SecondPage({super.key,required this.username});

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Second Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            const Text('hii', style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold),
            ),
             TextField(
              controller: textFieldController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),

                hintText: 'enter your name',
                border: InputBorder.none,
              ),
            ),
            ElevatedButton(
              child:const Text('Go To Third Page'),
              onPressed:(){

                _sendback(context);

              },
            ),

          ],
        ),

      ),
    );
  }

  void _sendback(BuildContext context){
    Navigator.pushNamed(context, '/third', arguments: {'name': textFieldController.text.toString(),'notifier': username});
    textFieldController.clear();
  }
}