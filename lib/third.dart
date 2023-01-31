import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget{
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context){
    Map<String, dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('third page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
             '${args['name']}'
              ,
              style: const TextStyle(
                  fontSize: 20),
            ),
            const Text(
              'Are you sure? ',
              style: TextStyle(
                  fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Yes'),
                    onPressed: (){
                      args['notifier'].value= args['name'];
                      Navigator.popUntil(context, ModalRoute.withName('/') );
                    },

                  ),
                ),
                ElevatedButton(
                  child: const Text('No'),
                  onPressed: (){
                     Navigator.pop(context);
                  },

                ),
              ],
            ),



          ],

        ),

      ),
    );
  }
}