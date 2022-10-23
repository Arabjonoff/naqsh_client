import 'package:flutter/material.dart';
import 'package:naqsh_client/src/router/routers.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final _route = RouterGenerator();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData.light(),
      initialRoute: '/login',
      onGenerateRoute: _route.onGenerator,
    );
  }
}


