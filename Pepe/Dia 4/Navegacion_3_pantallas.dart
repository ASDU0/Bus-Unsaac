import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App con 3 Pantallas',
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaInicio(),
        '/segunda': (context) => PantallaSegunda(),
        '/tercera': (context) => PantallaTercera(),
      },
    );
  }
}

class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Inicio')),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a Segunda Pantalla'),
          onPressed: () {
            Navigator.pushNamed(context, '/segunda');
          },
        ),
      ),
    );
  }
}

class PantallaSegunda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Estás en la segunda pantalla'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ir a Tercera Pantalla'),
              onPressed: () {
                Navigator.pushNamed(context, '/tercera');
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Volver a Inicio'),
              onPressed: () {
                Navigator.pop(context); // Regresa a la pantalla anterior
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaTercera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tercera Pantalla')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Llegaste a la tercera pantalla!'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Volver a Segunda Pantalla'),
              onPressed: () {
                Navigator.pop(context); // Regresa a la segunda pantalla
              },
            ),
            ElevatedButton(
              child: Text('Volver al Inicio'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
