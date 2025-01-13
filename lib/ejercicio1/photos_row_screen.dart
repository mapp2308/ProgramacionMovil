import 'package:flutter_application/screens/screens.dart';

class PhotosRowScreen extends StatelessWidget {
  const PhotosRowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos en Fila'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/imagen1.jpg', width: 100, height: 100),
            const SizedBox(width: 10),
            Image.asset('assets/imagen2.jpg', width: 100, height: 100),
            const SizedBox(width: 10),
            Image.asset('assets/imagen3.png', width: 100, height: 100),
            
          ],
        ),
      ),
    );
  }
}
