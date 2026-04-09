import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo[700]!,
              Colors.indigo[300]!,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.home,
                        size: 60,
                        color: Colors.indigo[700],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '¡Bienvenido!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Aplicación de Navegación\nDía 4 de Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Navigation Cards
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Navega por la aplicación',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Profile Card
                      _buildNavigationCard(
                        context,
                        icon: Icons.person,
                        title: 'Mi Perfil',
                        subtitle: 'Ver información personal',
                        color: Colors.blue,
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),

                      const SizedBox(height: 20),

                      // Settings Card
                      _buildNavigationCard(
                        context,
                        icon: Icons.settings,
                        title: 'Configuración',
                        subtitle: 'Ajustes de la aplicación',
                        color: Colors.green,
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                      ),

                      const SizedBox(height: 40),

                      // Info Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.indigo[200]!),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.indigo[700],
                              size: 40,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Navegación en Flutter',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Esta app demuestra la navegación entre pantallas usando Navigator y rutas nombradas.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
