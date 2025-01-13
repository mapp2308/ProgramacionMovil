import 'package:flutter_application/screens/screens.dart';

class PhotosColumnScreen extends StatelessWidget {
  const PhotosColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos en Columna'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/imagen1.jpg', width: 150, height: 150),
            const SizedBox(height: 10),
            Image.asset('assets/imagen2.jpg', width: 150, height: 150),
            const SizedBox(height: 10),
            Image.asset('assets/imagen3.png', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
