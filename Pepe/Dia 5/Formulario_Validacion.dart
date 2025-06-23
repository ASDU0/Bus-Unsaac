import 'package:flutter/material.dart';

void main() => runApp(FormularioApp());

class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario con Validación',
      home: FormularioScreen(),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores opcionales si quieres acceder al texto ingresado
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      // Aquí podrías enviar los datos a un servidor o procesarlos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulario válido 🎉')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: correoController,
                decoration: InputDecoration(labelText: 'Correo'),
                keyboardType: TextInputType.emailAddress,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Por favor ingresa un correo';
                  }
                  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regex.hasMatch(valor)) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (valor) {
                  if (valor == null || valor.length < 6) {
                    return 'Debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('Enviar'),
                onPressed: _enviarFormulario,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
