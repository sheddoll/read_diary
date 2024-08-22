import 'package:flutter/material.dart';
import 'core/routes.dart';
import 'core/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routes: routes,
      initialRoute: '/homePage',

    );
  }
}