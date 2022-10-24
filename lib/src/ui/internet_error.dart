import 'package:flutter/material.dart';

class InternetErrorScreen extends StatelessWidget {
  const InternetErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(Icons.signal_wifi_connected_no_internet_4_outlined,size: 55,)),
    );
  }
}
