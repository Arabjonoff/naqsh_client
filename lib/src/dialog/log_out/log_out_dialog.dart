import 'package:flutter/material.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowLogOutDialog{
  static void showLogOutDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Tizimdan chiqish'),
        content: const Text('Rostanham tizimdan chiqmoqchimisz?',textAlign: TextAlign.center,),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Bekor qilish',style: TextStyle(color: Colors.red,fontSize: 15),)),
          TextButton(onPressed: ()async{
            final prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            Repository _repo = Repository();
            _repo.clear();
            // ignore: use_build_context_synchronously
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/login');
          }, child: Text('Tizimdan chiqish',style: TextStyle(fontSize: 15))),
        ],
      );
    }
    );
  }
}