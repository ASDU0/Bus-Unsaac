
import 'package:flutter/material.dart';
import 'pantalla1.dart';
import 'pantalla2.dart';
import 'pantalla3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de 3 Pantallas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 40, 0, 150),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const Pantalla1(),
        '/pantalla2': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
      },
    );
  }
}
