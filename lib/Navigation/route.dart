import 'package:data_list/Pages/home.dart';
import 'package:data_list/Pages/login.dart';
import 'package:flutter/material.dart';

import 'routeNames.dart';

class Navigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
