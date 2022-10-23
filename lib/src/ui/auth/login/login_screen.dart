import 'package:flutter/material.dart';
import 'package:naqsh_client/src/ui/bottom_navigation/home/home_screen.dart';
import 'package:naqsh_client/src/ui/bottom_navigation/main_screen.dart';
import 'package:naqsh_client/src/widget/button/ontap_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final _controllerDb = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Hisobga Kirish',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _controllerDb,
                    decoration: const InputDecoration(
                      labelText: 'Baza raqami',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    controller: _controllerPhone,
                    decoration: const InputDecoration(
                        counterText: '',
                      prefixText: '+998 ',
                      labelText: 'Telfon raqam',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _controllerPassword,
                    decoration: const InputDecoration(
                      labelText: 'Parol kiriting',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(height: 32,),
                OnTapWidget(text: 'Kirish', onTap: (){
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/');
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
