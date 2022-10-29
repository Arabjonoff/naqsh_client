import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowLogOutDialog{
  static void showLogOutDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title:  Text('logout'.tr()),
        content:  Text('alert'.tr(),textAlign: TextAlign.center,),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child:  Text('back'.tr(),style: const TextStyle(color: Colors.red,fontSize: 15),)),
          TextButton(onPressed: ()async{
            final prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            Repository _repo = Repository();
            _repo.clear();
            // ignore: use_build_context_synchronously
            Navigator.popUntil(context, (route) => route.isFirst);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/login');
          }, child:  Text('logout'.tr(),style: const TextStyle(fontSize: 15))),
        ],
      );
    }
    );
  }
}