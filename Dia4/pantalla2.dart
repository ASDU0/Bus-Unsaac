// FALTA IMPLEMENTAR 
      

'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pantalla3');
          },
          child: const Text('Ir a Pantalla 3'),
        ),
      ),
    );
  }
}

