import 'package:flutter/material.dart';

class BusProvider extends ChangeNotifier {
  int _pasajeros = 0;
  final int _capacidadMaxima = 50;

  int get pasajeros => _pasajeros;
  int get capacidadMaxima => _capacidadMaxima;

  void subirPasajero() {
    if (_pasajeros < _capacidadMaxima) {
      _pasajeros++;
      notifyListeners();
    }
  }

  void bajarPasajero() {
    if (_pasajeros > 0) {
      _pasajeros--;
      notifyListeners();
    }
  }
}
