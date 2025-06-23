import 'package:flutter/material.dart';
void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Widgets Básicos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widgets Básicos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hola, Flutter!', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Botón presionado');
                },
                child: Text('Presionar'),
              ),
              SizedBox(height: 20),
              Icon(Icons.favorite, color: Colors.red, size: 40),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ingresa tu nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

Image.network('data:image/png;base64,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', height: 100),
            ],
          ),
        ),
      ),
    );
  }
}