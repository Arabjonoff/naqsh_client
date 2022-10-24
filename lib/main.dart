import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/router/routers.dart';
import 'package:naqsh_client/src/ui/theme/app_theme.dart';

void main()  {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
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
            initialRoute: '/login',
            onGenerateRoute: _route.onGenerator,
          );
        });
  }
}

class ThemeStream {
  static StreamController<bool> setTheme = StreamController();
}
