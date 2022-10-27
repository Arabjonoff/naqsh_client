import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naqsh_client/main.dart';
import 'package:naqsh_client/src/bloc/database/login_database.dart';
import 'package:naqsh_client/src/dialog/lang_dialog/lang_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:naqsh_client/src/dialog/log_out/log_out_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/auth/login/login_model.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
bool _isDark = false;
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  initState(){
    super.initState();
    usd();
    debt();
    dataBase.getLoginDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SafeArea(
        child: StreamBuilder<List<LoginModel>>(
          stream: dataBase.getUser,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 33),
                      child: Center(
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(Icons.person,size: 42,color: Colors.grey,),
                          ),
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(bottom: 10.0,top: 10),
                      child: Text(snapshot.data![0].name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    ),
                   snapshot.data![0].d3==1? Padding(
                     padding: const EdgeInsets.only(bottom: 10.0),
                     child: Text('Qarzdorlik -${getDebt} uzs',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                   ):const SizedBox(height: 10,),
                   snapshot.data![0].d3==1? Padding(
                     padding: const EdgeInsets.only(bottom: 10.0),
                     child: Text('Dollar -${getDebtS.toStringAsFixed(2)} usd',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                   ):const SizedBox(height: 10,),
                    snapshot.data![0].d4== 1?Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 0),
                      child: Text('Kod ${snapshot.data![0].idT}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                    ):Container(),

                    ListTile(
                        leading: Icon(Icons.attach_money),
                        title: Text('Valyuta kursi'),
                        trailing: Text(getUsd.toString() +' uzs',style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    ListTile(
                        leading: Icon(Icons.dark_mode),
                        title: Text('Temani ozgartish'),
                        trailing: CupertinoSwitch(value: _isDark, onChanged: (value){
                          setState(() {
                            _isDark = !_isDark;
                            ThemeStream.setTheme.add(_isDark);
                          });
                        })
                    ),
                    ListTile(
                      onTap: (){
                        ShowBottomLanguageDialog.showLangDialog(context);
                      },
                      leading: Icon(Icons.language),
                      title: Text('Tilni ozgartish'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, '/order');
                      },
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Text('Buyurtmalar'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){
                        ShowLogOutDialog.showLogOutDialog(context);
                      },
                      leading: Icon(Icons.logout),
                      title: Text('Tizimdan chiqish'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              );
            }return const Center(child: CircularProgressIndicator(),);
          }
        ),
      ),
    );
  }
  usd()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var db = preferences.getString('db');
    http.Response response = await http.get(Uri.parse('https://naqshsoft.site/getkurs?DB=$db&'));
    final Map<String ,dynamic> data = json.decode(response.body);
    setState((){
      getUsd = data['KURS'];
    });
  }
  debt()async{
    var now = DateTime.now();
    var years = DateFormat('yyyy');
    var months = DateFormat('MM');
    String year = years.format(now);
    String month = months.format(now);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var db = preferences.getString('db');
    var idt = preferences.getString('idt');
    http.Response response = await http.get(Uri.parse('https://naqshsoft.site/karzi?DB=$db&ID_TOCH=$idt&YIL=$year&OY=$month&TP=0&'));
    final Map<String ,dynamic> data = json.decode(response.body);
    setState((){
      getDebt = data['KARZI'];
      getDebtS = data['KARZI_S'];
    });
  }
  int getUsd = 0;
  int getDebt = 0;
  double getDebtS = 0;
}
