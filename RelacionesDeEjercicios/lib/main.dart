import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa el archivo HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF3b605f),  // Color principal
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF96bebc),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3b605f),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF698f8e),
        ),
      ),
      home: const HomeScreen(), // Llama a HomeScreen
    );
  }
}