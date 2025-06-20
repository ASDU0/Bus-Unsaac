# Carpeta de Imágenes

Esta carpeta está destinada para almacenar las imágenes de la aplicación.

## Uso
- Coloca aquí las imágenes que quieras usar en la aplicación
- Asegúrate de referenciarlas correctamente en el archivo `pubspec.yaml`
- Formatos soportados: PNG, JPG, GIF, SVG

## Ejemplo de imagen de perfil
Si quieres agregar una imagen de perfil personalizada:
1. Coloca tu imagen aquí (ej: `perfil.jpg`)
2. Actualiza el código en `perfil_screen.dart` para usar la imagen:
   ```dart
   CircleAvatar(
     radius: 56,
     backgroundImage: AssetImage('assets/images/perfil.jpg'),
   )
   ```
