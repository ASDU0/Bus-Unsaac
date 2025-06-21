
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://www.reddit.com/r/aww/comments/5h9gbr/cat_riding_dog/?tl=es-es',
              ), // Asegúrate de tener esta imagen en assets
            ),
            const SizedBox(height: 16),
            const Text(
              'Eduardo Torre Cano ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '211361@unsaac.edu.pe',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar perfil'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Acción al editar
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Acción al entrar en configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Acción al cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
