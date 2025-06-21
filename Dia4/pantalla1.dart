
import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos Personales')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Eduardo Torre Cano'),
            const SizedBox(height: 16),

            const Text(
              'Correo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('211361@unsaac.edu.pe'),
            const SizedBox(height: 16),

            const Text(
              'Teléfono:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('+51 987654321'),

            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pantalla2');
                },
                child: const Text('Ver estudios'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
