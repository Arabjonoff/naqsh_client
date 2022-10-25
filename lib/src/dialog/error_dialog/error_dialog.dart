import 'package:flutter/material.dart';

class ShowErrorDialog{

  static void showErrorDialog(BuildContext context, String body, title){
    showDialog(context: context, builder: (builder){
      return AlertDialog(
        title:  Text(title),
        content: Text(body,textAlign: TextAlign.center,),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],
      );
    });
  }
}