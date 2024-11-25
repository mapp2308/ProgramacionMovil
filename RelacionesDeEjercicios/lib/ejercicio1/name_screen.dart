import 'package:flutter_application/rutas_nombradas/screens.dart';
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
            
            Container(
              color: const Color(0xFF94CCF9),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 9, top: 20),
              child: const Text(
                'https://github.com/mapp2308/ProgramacionMovil',
              style: TextStyle(fontSize: 15, color: Color(0xFF04589A)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
