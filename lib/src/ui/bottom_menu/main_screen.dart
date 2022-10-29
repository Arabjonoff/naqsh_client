import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naqsh_client/src/ui/bottom_menu/cart/cart_screen.dart';
import 'package:naqsh_client/src/ui/bottom_menu/profile/profile_screen.dart';

import 'home/home_screen.dart';


class MainScreen extends StatefulWidget {
   MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xFF5F6DF8),
          onTap: (screens){
            setState((){
              selectedIndex = screens;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label: ''),
          ],
        ),
      ),
      body:screens[selectedIndex]
    );
  }
}
