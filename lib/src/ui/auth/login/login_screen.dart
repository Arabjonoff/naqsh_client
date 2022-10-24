import 'package:flutter/material.dart';
import 'package:naqsh_client/src/provider/app_provider.dart';
import 'package:naqsh_client/src/repository/repository.dart';
import 'package:naqsh_client/src/widget/button/ontap_widget.dart';

import '../../../model/auth/login/login_model.dart';
import '../../../model/http/http_model.dart';

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
                const Text('Tizimga Kirish',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: TextFormField(
                    controller: _controllerPassword,
                    decoration: const InputDecoration(
                        labelText: 'Parol kiriting',
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(height: 32,),
                OnTapWidget(text: 'Kirish', onTap: () async {
                  Repository _repos = Repository();
                  HttpResult response = await _repos.login(
                      _controllerDb.text, "998" + _controllerPhone.text,
                      _controllerPassword.text);
                  var result = LoginModel.fromJson(response.result);
                  var res = LoginModel(
                      d1: result.d1,
                      d2: result.d2,
                      d3: result.d3,
                      d4: result.d4,
                      name: result.name,
                      idT: result.idT,
                );
                  _repos.saveLogin(res);
                  // _repos.login(_controllerDb.text, '998${_controllerPhone.text}', _controllerPassword.text);
                  // Navigator.popUntil(context, (route) => route.isFirst);
                  // Navigator.pushReplacementNamed(context, '/');
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
