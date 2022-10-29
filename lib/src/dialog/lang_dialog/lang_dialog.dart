import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShowBottomLanguageDialog{
  static void showLangDialog(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context, builder: (context){
      return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
        ),
        child: SizedBox(
          height: 250,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width /4,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.grey
                  ),
                ),
                const SizedBox(height: 24,),
                  Card(
                  child: ListTile(
                    onTap: (){
                      context.setLocale(const Locale('uz',));
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.language),
                    title: const Text("O'zbek (lotin)"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: (){
                      context.setLocale(const Locale('en',));
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.language),
                    title: const Text("Ўзбек (Кирил)"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: (){
                      context.setLocale(const Locale('ru',));
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.language),
                    title: const Text("Русский"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}