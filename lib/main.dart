import 'package:flutter/material.dart';
import 'package:grocery_list_flutter/screens/create_list_screen.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData appTheme = ThemeData(
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF7F56D9), // Primary color for buttons
    textTheme: ButtonTextTheme.primary,
  ),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List App',
      theme: appTheme,
      home: const CreateItemScreen(),
    );
  }
}
