import 'screens/screens.dart';// Importa el archivo de las

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Example"),
      ),
      drawer: const CustomDrawer(), // Usa el CustomDrawer aquí
      body: const Center(
        child: Text(
          'Selecciona una opción del drawer',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF3b605f),
          ),
        ),
      ),
    );
  }
}
