import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modelo de tarea
class Tarea {
  String titulo;
  bool completada;

  Tarea({required this.titulo, this.completada = false});
}

// Provider de tareas
class TareasProvider extends ChangeNotifier {
  List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  void agregarTarea(String titulo) {
    _tareas.add(Tarea(titulo: titulo));
    notifyListeners();
  }

  void eliminarTarea(int index) {
    _tareas.removeAt(index);
    notifyListeners();
  }

  void alternarEstado(int index) {
    _tareas[index].completada = !_tareas[index].completada;
    notifyListeners();
  }
}

// App principal
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TareasProvider(),
      child: MaterialApp(
        title: 'To-Do List con Provider',
        home: TareasScreen(),
      ),
    ),
  );
}

class TareasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tareasProvider = Provider.of<TareasProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tareas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Nueva tarea'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final texto = _controller.text.trim();
                    if (texto.isNotEmpty) {
                      tareasProvider.agregarTarea(texto);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tareasProvider.tareas.length,
              itemBuilder: (context, index) {
                final tarea = tareasProvider.tareas[index];
                return ListTile(
                  leading: Checkbox(
                    value: tarea.completada,
                    onChanged: (_) {
                      tareasProvider.alternarEstado(index);
                    },
                  ),
                  title: Text(
                    tarea.titulo,
                    style: TextStyle(
                      decoration: tarea.completada
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      tareasProvider.eliminarTarea(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}