import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naqsh_client/main.dart';
import 'package:naqsh_client/src/dialog/lang_dialog/lang_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
bool _isDark = false;
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey
      ),
                child: Icon(Icons.person,size: 42,color: Colors.grey,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0,top: 10),
              child: Text('Admin'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 38.0),
              child: Text('Qarzi 100210 0210 uzs ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.attach_money),
              title: Text('Valyuta kursi'),
              trailing: Text('lorem ipsum dolor',style: TextStyle(fontWeight: FontWeight.bold),)
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
              onTap: (){},
              leading: Icon(Icons.logout),
              title: Text('Tizimdan chiqish'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
