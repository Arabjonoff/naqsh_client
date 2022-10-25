import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/router/routers.dart';
import 'package:naqsh_client/src/ui/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token") ?? '';
  runApp(
    MyApp(
      token: token,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String token;

  MyApp({Key? key, required this.token}) : super(key: key);
  final _route = RouterGenerator();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: false,
        stream: ThemeStream.setTheme.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: snapshot.data ? AppTheme.dark() : AppTheme.light(),
            initialRoute: token == '' ? '/login' : '/',
            onGenerateRoute: _route.onGenerator,
          );
        });
  }
}

class ThemeStream {
  static StreamController<bool> setTheme = StreamController();
}
