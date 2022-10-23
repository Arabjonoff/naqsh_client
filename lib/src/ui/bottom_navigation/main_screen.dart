import 'package:flutter/material.dart';
import 'package:naqsh_client/src/ui/bottom_navigation/cart/cart_screen.dart';
import 'package:naqsh_client/src/ui/bottom_navigation/home/home_screen.dart';
import 'package:naqsh_client/src/ui/bottom_navigation/profile/profile_screen.dart';

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
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (screens){
          setState((){
            selectedIndex = screens;
          });
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Asosiy',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: 'Savat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label: 'Profile'),
        ],
      ),
      body:screens[selectedIndex]
    );
  }
}
