import 'package:flutter_application/screens/screens.dart';

class DesafiosScreen extends StatelessWidget {
  const DesafiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafío contenedores'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
