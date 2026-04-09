import 'package:flutter/material.dart';
import 'perfil_screen.dart';

void main() {
  runApp(const PerfilApp());
}

class PerfilApp extends StatelessWidget {
  const PerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PerfilScreen(),
    );
  }
}
