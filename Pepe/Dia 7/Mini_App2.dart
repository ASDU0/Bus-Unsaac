import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BusProvider(),
      child: MyApp(),
    ),
  );
}

/// Modelo Bus (clase con propiedades y métodos)
class Bus {
  final String marca;
  final int capacidadMaxima;
  int pasajerosActuales;

  Bus({
    required this.marca,
    required this.capacidadMaxima,
    this.pasajerosActuales = 0,
  });

  bool subirPasajero() {
    if (pasajerosActuales < capacidadMaxima) {
      pasajerosActuales++;
      return true;
    }
    return false;
  }

  bool bajarPasajero() {
    if (pasajerosActuales > 0) {
      pasajerosActuales--;
      return true;
    }
    return false;
  }
}

/// Provider que maneja el estado del Bus
class BusProvider extends ChangeNotifier {
  Bus _bus = Bus(marca: "Mercedes", capacidadMaxima: 50);

  Bus get bus => _bus;

  void subirPasajero() {
    if (_bus.subirPasajero()) {
      notifyListeners();
    }
  }

  void bajarPasajero() {
    if (_bus.bajarPasajero()) {
      notifyListeners();
    }
  }

  /// Cambiar marca y capacidad (usado desde formulario)
  void actualizarBus(String marca, int capacidad) {
    _bus = Bus(marca: marca, capacidadMaxima: capacidad);
    notifyListeners();
  }
}

/// App Principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus con Provider y Navegación',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/config': (context) => ConfiguracionScreen(),
        '/detalle': (context) => DetalleScreen(),
      },
    );
  }
}

/// Pantalla 1 - Home (mostrar pasajeros y botones)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bus = context.watch<BusProvider>().bus;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pasajeros en el Bus'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/config'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Marca: ${bus.marca}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Pasajeros actuales:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${bus.pasajerosActuales}',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Capacidad máxima: ${bus.capacidadMaxima}',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<BusProvider>().bajarPasajero,
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: context.read<BusProvider>().subirPasajero,
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('Ver Detalle del Bus'),
              onPressed: () => Navigator.pushNamed(context, '/detalle'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pantalla 2 - Configuración (formulario con validación para cambiar marca y capacidad)
class ConfiguracionScreen extends StatefulWidget {
  @override
  _ConfiguracionScreenState createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _capacidadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bus = context.read<BusProvider>().bus;
    _marcaController.text = bus.marca;
    _capacidadController.text = bus.capacidadMaxima.toString();
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _capacidadController.dispose();
    super.dispose();
  }

  void _guardarCambios() {
    if (_formKey.currentState!.validate()) {
      final marca = _marcaController.text.trim();
      final capacidad = int.parse(_capacidadController.text.trim());
      context.read<BusProvider>().actualizarBus(marca, capacidad);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Configuración guardada')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Bus'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(labelText: 'Marca del Bus'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Ingrese la marca' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _capacidadController,
                decoration: InputDecoration(labelText: 'Capacidad Máxima'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la capacidad';
                  }
                  final n = int.tryParse(value);
                  if (n == null || n <= 0) {
                    return 'Ingrese un número válido > 0';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _guardarCambios,
                child: Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Pantalla 3 - Detalle (mostrar resumen y navegación de vuelta)
class DetalleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bus = context.watch<BusProvider>().bus;

    return Scaffold(
      appBar: AppBar(title: Text('Detalle del Bus')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Marca: ${bus.marca}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Pasajeros actuales: ${bus.pasajerosActuales}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Capacidad máxima: ${bus.capacidadMaxima}',
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            ElevatedButton(
              child: Text('Volver al Inicio'),
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
            ),
          ],
        ),
      ),
    );
  }
}
