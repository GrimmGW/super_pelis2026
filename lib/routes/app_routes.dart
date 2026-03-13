import 'package:flutter/material.dart';
import 'package:super_pelis2026/screens/screens.dart';

class AppRoutes {

  static String initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/home' : (BuildContext context) => HomeScreen(),

  };

}