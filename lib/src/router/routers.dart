import 'package:flutter/material.dart';
import 'package:naqsh_client/src/ui/auth/login/login_screen.dart';
import 'package:naqsh_client/src/ui/bottom_menu/main_screen.dart';
import 'package:naqsh_client/src/ui/bottom_menu/profile/profile_screen.dart';
import 'package:naqsh_client/src/ui/detail/detail_screen.dart';

import '../ui/bottom_menu/cart/cart_screen.dart';
import '../ui/bottom_menu/home/home_screen.dart';
import '../ui/bottom_menu/profile/order/order_screen.dart';

class RouterGenerator {
  Route? onGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return _navigate(LoginScreen());
      case '/':
        return _navigate(MainScreen());
      case '/home':
        return _navigate(HomeScreen());
      case '/detail':
        return _navigate(DetailScreen());
      case '/cart':
        return _navigate(CartScreen());
      case '/profile':
        return _navigate(ProfileScreen());
      case '/order':
        return _navigate(OrderScreen());
    }
    return null;
  }
}

_navigate(Widget screen) {
  return MaterialPageRoute(builder: (context) => screen);
}
