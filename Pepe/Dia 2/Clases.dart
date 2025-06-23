// Clase abstracta
abstract class Vehiculo {
  final String marca;

  Vehiculo(this.marca);

  void encender();
  void apagar();
}

// Clase base con propiedades, getter, setter, método y constructor nombrado
class Bus extends Vehiculo {
  int _capacidadPasajeros;
  double _velocidad;
  static const int ruedas = 6;

  // Constructor principal
  Bus(String marca, this._capacidadPasajeros, this._velocidad) : super(marca);

  // Constructor nombrado desde JSON
  Bus.desdeJson(Map<String, dynamic> json)
      : _capacidadPasajeros = json['capacidadPasajeros'],
        _velocidad = json['velocidad'],
        super(json['marca']);

  // Getter
  int get capacidadPasajeros => _capacidadPasajeros;

  // Setter
  set capacidadPasajeros(int valor) {
    if (valor > 0) {
      _capacidadPasajeros = valor;
    }
  }

  // Getter para velocidad
  double get velocidad => _velocidad;

  // Setter para velocidad
  set velocidad(double v) {
    if (v >= 0) {
      _velocidad = v;
    }
  }

  // Métodos
  void tocarClaxon() {
    print("¡Piiip piiip! Soy un bus de la marca $marca.");
  }

  @override
  void encender() {
    print("Bus encendido.");
  }

  @override
  void apagar() {
    print("Bus apagado.");
  }

  // Método estático
  static void descripcion() {
    print("Un bus es un vehículo grande usado para transportar pasajeros.");
  }
}

// Programa principal
void main() {
  // Usando constructor normal
  Bus bus1 = Bus("Mercedes", 50, 80);
  bus1.tocarClaxon();
  bus1.encender();
  bus1.capacidadPasajeros = 60;
  print("Nueva capacidad: ${bus1.capacidadPasajeros}");

  // Usando constructor nombrado desde JSON
  var datos = {
    "marca": "Volvo",
    "capacidadPasajeros": 45,
    "velocidad": 75.5
  };

  Bus bus2 = Bus.desdeJson(datos);
  bus2.tocarClaxon();

  // Llamando a método estático
  Bus.descripcion();
}
