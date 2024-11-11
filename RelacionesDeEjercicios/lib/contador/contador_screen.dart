import 'package:flutter/material.dart';
//import 'package:hello_world_app/presentation/screens/counter/counter_sreen.dart';

import 'package:flutter_application/contador/screens/counter_function_screen.dart';

void main() {
  runApp(const ContadorApp());
}

class ContadorApp extends StatelessWidget {
  const ContadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CounterFunctionsScreen();
       
  }
}
