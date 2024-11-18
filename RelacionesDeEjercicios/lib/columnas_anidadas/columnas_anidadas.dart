import 'package:flutter/material.dart';
import 'package:flutter_application/elementos/customDrawer.dart';

class ColumnasAnidadas extends StatelessWidget {
  const ColumnasAnidadas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Primera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(Icons.call, 'Llamar 1'),
              ],
            ),
            const SizedBox(height: 20),
            // Segunda fila
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(Icons.phone_android, 'Llamar 2'),
                _buildIconColumn(Icons.phone, 'Llamar 3'),
              ],
            ),
            const SizedBox(height: 20),
            // Tercera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(Icons.contact_phone, 'Llamar 4'),
                _buildIconColumn(Icons.ring_volume, 'Llamar 5'),
                _buildIconColumn(Icons.phone_bluetooth_speaker, 'Llamar 6'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir cada icono con su texto
  Widget _buildIconColumn(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
