import 'package:flutter/material.dart';
import 'package:super_pelis2026/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperPelis',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.red,
          centerTitle: true,
          foregroundColor: Colors.black
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark
        )
      )
    );
  }
}