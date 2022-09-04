import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {

  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIos(BuildContext context){
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Cupertino Dialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children:const [
                Text('This is a simple alert dialog Ios.'),
                SizedBox(height: 16.0),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Read more', style:TextStyle( color: Colors.green)),

              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Closed')

              )
            ]
          );
        }
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return  AlertDialog(
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30)),
            title: const Text('AlertDialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children:const [
                Text('This is a simple alert dialog.'),
                SizedBox(height: 16.0),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Closed')
              )
            ]
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
       child: ElevatedButton(
         child: const Padding(
             padding: EdgeInsets.all(10.0),
              child: Text('Show Alert', style: TextStyle(fontSize: 18.0))
         ),
         onPressed:() => Platform.isAndroid
             ? displayDialogAndroid ( context )
             :  displayDialogIos ( context ) ,
       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }
}
