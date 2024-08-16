import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: _appBarTheme(),
      iconButtonTheme: _iconButtonThemeData()
  );
}

IconButtonThemeData _iconButtonThemeData() {
  return const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(36),
        iconColor: WidgetStatePropertyAll(Color.fromRGBO(232, 222, 248, 1)),
        fixedSize: WidgetStatePropertyAll(Size(180, 50)),
        backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(101, 85, 143, 1)),
      ),


    );
}

AppBarTheme _appBarTheme() {
  return  const AppBarTheme(
    color:  Color.fromRGBO(254, 247, 255, 1),
    elevation: 10,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color.fromRGBO(29, 27, 32, 1)),
    titleTextStyle: TextStyle(color: Color.fromRGBO(29, 27, 32, 1), fontSize: 28),
  );
}