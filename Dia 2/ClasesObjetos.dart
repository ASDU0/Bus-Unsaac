class cPersona {
  // Atributos
  String? aNombre;
  int? aEdad;
  int? aDNI;

  // DART SOLO PERMITE UN CONSTRUCTOR POR DEFECTO
  // Constructor con parámetros posicionales definidos
  cPersona(String pNombre, int pEdad, int pDNI)
    : this.aNombre = pNombre,
      this.aEdad = pEdad,
      this.aDNI = pDNI;

  // Constructor con parámetros definidos y valores por defecto
  // cPersona(String pNombre, [int pEdad = 18, int pDNI = 0])

  // Constructor con parámetros con nombre opcionales
  // cPersona({this.aNombre, this.aEdad, this.aDNI});

  // Métodos GET
  String? get nombre => aNombre;
  int? get edad => aEdad;
  int? get dni => aDNI;

  // Métodos SET
  set nombre(String? pNombre) => aNombre = pNombre;
  set edad(int? pEdad) => aEdad = pEdad;
  set dni(int? pDNI) => aDNI = pDNI;

  void mostrarDatos() {
    print("Nombre: $aNombre, Edad: $aEdad, DNI: $aDNI");
  }
}

void main() {
  // Crear objetos con parámetros posicionales definidos
  cPersona persona1 = cPersona("Jhon", 21, 12345678);

  // Crear otro objeto con valores por defecto
  // cPersona persona1 = cPersona("Ana");

  // Crear otro objeto con parámetros con nombre opcionales
  // cPersona persona1 = cPersona(aNombre: "Ana", aEdad: 21, aDNI: 12345678);

  // Mostrar los datos del segundo objeto
  persona1.mostrarDatos();

  // Ejemplo de uso de getters y setters
  print("Nombre: ${persona1.nombre}");
  persona1.edad = 21;
  print("Nueva edad: ${persona1.edad}");
}
