import 'dart:async';
import 'dart:math';
import 'package:flutter_application/rutas_nombradas/screens.dart';



class ImagenesAleatorias extends StatefulWidget {
  const ImagenesAleatorias({super.key});

  @override
  ClickGameState createState() => ClickGameState();
}

class ClickGameState extends State<ImagenesAleatorias> {
  int score = 0;
  double posX = 0;
  double posY = 0;
  Random random = Random();
  late Timer timer;
  bool isClickable = true;
  final int timeLimit = 1; // Tiempo límite para hacer clic (en segundos)
 List<String> images = [
    'assets/mora_paraiso-portada.jpg' ,
    'assets/mora_estrella-portada.jpg' ,
    'assets/microdosis.jpg' ,
  ];
  String currentImage = 'assets/foto1.jpeg';
  double maxWidth = 0;
  double maxHeight = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    maxWidth = MediaQuery.of(context).size.width - 100;
    maxHeight = MediaQuery.of(context).size.height - 200;
    timer = Timer(const Duration(seconds: 0), () {}); // Inicializamos el temporizador vacío
    startGame();
  }

  void startGame() {
    moveImage();
    restartTimer();
  }

  void restartTimer() {
    if (timer.isActive) {
      timer.cancel();
    }

    timer = Timer.periodic(Duration(seconds: timeLimit), (timer) {
      if (isClickable) {
        setState(() {
          score -= 2; // Restar puntos si no se hace clic
        });
      }
      moveImage();
    });
  }

  void moveImage() {
    setState(() {
      posX = random.nextDouble() * maxWidth;
      posY = random.nextDouble() * maxHeight;
      currentImage = images[random.nextInt(images.length)];
      isClickable = true;
    });
    restartTimer(); // Reiniciar el temporizador después de mover la imagen
  }

  void onImageClick() {
    if (isClickable) {
      setState(() {
        score += 1; // Sumar un punto si se hace clic
        isClickable = false; // Evitar múltiples clics
      });
      moveImage(); // Cambiar la imagen inmediatamente al hacer clic
    }
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Clic Aleatorio'),
      ),
      drawer: const CustomDrawer(), // Aquí se llama al CustomDrawer
      body: Stack(
        children: [
          Positioned(
            left: posX,
            top: posY,
            child: GestureDetector(
              onTap: onImageClick,
              child: Image.asset(
                currentImage,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Puntaje: $score',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
