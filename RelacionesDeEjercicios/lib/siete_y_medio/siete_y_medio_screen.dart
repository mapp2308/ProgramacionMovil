import 'dart:math';

import '../screens/screens.dart';

class SieteYMedioApp extends StatelessWidget {
  const SieteYMedioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SieteYMedioHome();
    
  }
}

class SieteYMedioHome extends StatefulWidget {
  const SieteYMedioHome({super.key});

  @override
  SieteYMedioHomeState createState() => SieteYMedioHomeState();
}

class SieteYMedioHomeState extends State<SieteYMedioHome> {
  final List<Map<String, dynamic>> baraja = [
    {'carta': '1', 'valor': 1},
    {'carta': '2', 'valor': 2},
    {'carta': '3', 'valor': 3},
    {'carta': '4', 'valor': 4},
    {'carta': '5', 'valor': 5},
    {'carta': '6', 'valor': 6},
    {'carta': '7', 'valor': 7},
    {'carta': 'Sota', 'valor': 0.5},
    {'carta': 'Caballo', 'valor': 0.5},
    {'carta': 'Rey', 'valor': 0.5},
  ];

  List<Map<String, dynamic>> mazo = [];
  List<String> cartasUsuario = [];
  List<String> cartasMaquina = [];
  double puntosUsuario = 0;
  double puntosMaquina = 0;
  int victoriasUsuario = 0;
  int victoriasMaquina = 0;
  bool partidaTerminada = false;

  @override
  void initState() {
    super.initState();
    _nuevaPartida();
  }

  void _nuevaPartida() {
    setState(() {
      mazo = List.from(baraja)..shuffle(Random());
      cartasUsuario = [];
      cartasMaquina = [];
      puntosUsuario = 0;
      puntosMaquina = 0;
      partidaTerminada = false;
    });
  }

  void _pedirCartaUsuario() {
    if (mazo.isNotEmpty && puntosUsuario < 7.5) {
      final carta = mazo.removeLast();
      setState(() {
        cartasUsuario.add(carta['carta']);
        puntosUsuario += carta['valor'];
        if (puntosUsuario > 7.5) {
          partidaTerminada = true;
          _determinarGanador();
        }
      });
    }
  }

  void _pedirCartasMaquina() {
    while (puntosMaquina < 5.5 && puntosMaquina <= 7.5) {
      final carta = mazo.removeLast();
      setState(() {
        cartasMaquina.add(carta['carta']);
        puntosMaquina += carta['valor'];
      });
    }
    partidaTerminada = true;
    _determinarGanador();
  }

  void _plantarse() {
    _pedirCartasMaquina();
  }

  void _determinarGanador() {
    String mensaje;
    if (puntosUsuario > 7.5 || (puntosMaquina <= 7.5 && puntosMaquina > puntosUsuario)) {
      mensaje = '¡La máquina gana!';
      victoriasMaquina++;
    } else if (puntosMaquina > 7.5 || puntosUsuario > puntosMaquina) {
      mensaje = '¡El usuario gana!';
      victoriasUsuario++;
    } else {
      mensaje = '¡Empate!';
    }

    if (victoriasUsuario == 5 || victoriasMaquina == 5) {
      mensaje += '\n${victoriasUsuario == 5 ? "¡El usuario ganó la partida!" : "¡La máquina ganó la partida!"}';
      victoriasUsuario = 0;
      victoriasMaquina = 0;
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Resultado'),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _nuevaPartida();
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('7 y Medio'),
      ),
      drawer: const CustomDrawer(), // Placeholder for CustomDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Victorias Usuario: $victoriasUsuario - Máquina: $victoriasMaquina',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Tus cartas: ${cartasUsuario.join(', ')} (Puntos: $puntosUsuario)'),
            const SizedBox(height: 20),
            if (partidaTerminada) Text('Cartas Máquina: ${cartasMaquina.join(', ')} (Puntos: $puntosMaquina)'),
            const Spacer(),
            if (!partidaTerminada)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _pedirCartaUsuario,
                    child: const Text('Pedir Carta'),
                  ),
                  ElevatedButton(
                    onPressed: _plantarse,
                    child: const Text('Plantarse'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
