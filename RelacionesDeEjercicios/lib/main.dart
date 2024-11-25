import 'package:flutter/material.dart';
import 'rutas_nombradas/app_routes.dart'; // Importa el archivo donde están definidas las rutas nombradas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Drawer Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF3b605f), // Color principal
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF96bebc),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3b605f),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF698f8e),
        ),
      ),
      initialRoute: AppRoutes.home, // Define la ruta inicial como una ruta nombrada
      routes: AppRoutes.routes, // Registra el mapa de rutas nombradas
    );
  }
}