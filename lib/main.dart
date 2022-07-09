import 'package:flutter/material.dart';
import 'Navigation/route.dart';
import 'Navigation/routeNames.dart';
import 'Themes/appThemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data List',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Navigation.generateRoute,
      initialRoute: login,
      theme: CustomTheme.lightTheme,
    );
  }
}
