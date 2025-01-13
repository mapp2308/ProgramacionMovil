import 'dart:math';
import 'package:flutter_application/screens/screens.dart';

class AdivinaNumeroApp extends StatelessWidget {
  const AdivinaNumeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdivinaNumeroPantalla();
  }
}

class AdivinaNumeroPantalla extends StatefulWidget {
  const AdivinaNumeroPantalla({super.key});

  @override
  AdivinaNumeroPantallaState createState() => AdivinaNumeroPantallaState();
}

class AdivinaNumeroPantallaState extends State<AdivinaNumeroPantalla> {
  final TextEditingController _numeroController = TextEditingController();
  late int _numeroSecreto;
  String _mensaje = "Adivina el número entre 1 y 100";
  bool _juegoTerminado = false;

  @override
  void initState() {
    super.initState();
    _reiniciarJuego();
  }

  void _validarNumero() {
    final int? numeroIngresado = int.tryParse(_numeroController.text);

    if (numeroIngresado == null) {
      setState(() {
        _mensaje = "Introduce un número válido.";
      });
    } else if (numeroIngresado < _numeroSecreto) {
      setState(() {
        _mensaje = "El número es mayor.";
      });
    } else if (numeroIngresado > _numeroSecreto) {
      setState(() {
        _mensaje = "El número es menor.";
      });
    } else {
      setState(() {
        _mensaje = "¡Correcto! Has adivinado el número.";
        _juegoTerminado = true;
      });
    }
    _numeroController.clear();
  }

  void _reiniciarJuego() {
    setState(() {
      _numeroSecreto = Random().nextInt(100) + 1;
      _mensaje = "Adivina el número entre 1 y 100";
      _juegoTerminado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adivina el Número"),
      ),
      drawer: const CustomDrawer(), // Placeholder for CustomDrawer
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _mensaje,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (!_juegoTerminado)
                TextField(
                  controller: _numeroController,
                  decoration: const InputDecoration(
                    labelText: "Introduce tu número",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              const SizedBox(height: 20),
              if (!_juegoTerminado)
                ElevatedButton(
                  onPressed: _validarNumero,
                  child: const Text("Comprobar"),
                ),
              if (_juegoTerminado)
                ElevatedButton(
                  onPressed: _reiniciarJuego,
                  child: const Text("Reiniciar Juego"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


