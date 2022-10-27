import 'package:flutter/material.dart';

class ShowBottomLanguageDialog{
  static void showLangDialog(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 250,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width /4,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey
                ),
              ),
              const SizedBox(height: 24,),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("O'zbek (lotin)"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("O'zbek (крил)"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Russia"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}