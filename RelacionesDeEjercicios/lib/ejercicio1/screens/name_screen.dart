import 'package:flutter/material.dart';
import 'package:flutter_application/elementos/customDrawer.dart';
import 'package:google_fonts/google_fonts.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Nombre y Apellidos'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Miguel Antonio Peraza Peña',
              style: GoogleFonts.lobster(
                fontSize: 32,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'https://github.com/mapp2308/ProgramacionMovil',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
