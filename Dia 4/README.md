# 📱 Día 4 - Navegación con Bottom Navigation

## 📋 Descripción
Aplicación móvil Flutter que implementa navegación usando **Bottom Navigation Bar** con 3 tabs. Esta aplicación demuestra el uso de una interfaz unificada con navegación inferior para cambiar entre diferentes secciones.

## 🎯 Objetivos del Proyecto
- Implementar navegación con Bottom Navigation Bar
- Crear una interfaz con 3 secciones/tabs
- Manejar estado para cambio de tabs
- Diseñar cada sección con contenido único
- Evitar problemas de overflow en el layout

## 🚀 Características Implementadas

### 📱 Interfaz Unificada con 3 Tabs:

1. **🏠 Tab de Inicio:**
   - Pantalla de bienvenida con gradiente índigo
   - Información sobre la aplicación
   - Diseño centrado y responsivo

2. **👤 Tab de Perfil:**
   - Perfil de usuario con información personal
   - Cards con información de contacto
   - Estadísticas del usuario
   - Header con gradiente azul

3. **⚙️ Tab de Configuración:**
   - Switches para preferencias (notificaciones, modo oscuro, ubicación)
   - Botones informativos
   - Diálogo "Acerca de"
   - Header con gradiente verde

### 🧭 Bottom Navigation Bar:
- **3 tabs fijos**: Inicio, Perfil, Configuración
- **Iconos temáticos**: home, person, settings
- **Estado persistente**: Mantiene el tab seleccionado
- **Colores adaptativos**: Colores diferentes por sección

## 🛠️ Estructura del Proyecto
```
lib/
└── main.dart    # Aplicación completa con Bottom Navigation
```

## 🎨 Características de UI:
- **Material Design**: Componentes nativos
- **Bottom Navigation**: Navegación inferior fija
- **Gradientes**: Cada tab con su color distintivo
- **Cards elevadas**: Elementos con sombras
- **Responsive**: Sin problemas de overflow
- **Iconografía**: Iconos coherentes por sección

## 🧭 Mapa de Navegación
```
HomeScreen (/)
├── ProfileScreen (/profile)
│   ├── → SettingsScreen (/settings)
│   └── → HomeScreen (/) [Limpiar stack]
└── SettingsScreen (/settings)
    ├── → ProfileScreen (/profile)
    └── → HomeScreen (/) [Limpiar stack]
```

## 📱 Funcionalidades Interactivas

### 🏠 **Pantalla de Inicio:**
- Tarjetas clicables para navegación
- Información de la aplicación
- Diseño centrado y atractivo

### 👤 **Pantalla de Perfil:**
- Información personal editable
- Estadísticas del usuario
- Botones de acción funcionales

### ⚙️ **Pantalla de Configuración:**
- Switches para configuraciones
- Slider para tamaño de fuente
- Diálogo "Acerca de"
- Notificaciones con SnackBar

## 📱 Cómo Ejecutar
1. Asegúrate de tener Flutter instalado
2. Navega a la carpeta del proyecto:
   ```bash
   cd "Dia 4"
   ```
3. Generar archivos de plataforma:
   ```bash
   flutter create .
   ```
4. Obtén las dependencias:
   ```bash
   flutter pub get
   ```
5. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## 📚 Conceptos Aprendidos
- **Sistema de navegación de Flutter**
- **Rutas nombradas vs rutas anónimas**
- **Gestión del stack de navegación**
- **Diferentes métodos de Navigator**
- **Paso de datos entre pantallas**
- **Organización de pantallas en carpetas**
- **AppBar personalizada por pantalla**
- **StatefulWidget para estado local**

## 🎯 Patrones de Navegación Implementados
1. **Push Navigation**: Agregar pantalla al stack
2. **Pop Navigation**: Remover pantalla del stack
3. **Replace Navigation**: Reemplazar pantalla actual
4. **Clear Navigation**: Limpiar todo el stack

## ✨ Mejoras Futuras
- [ ] Animaciones personalizadas de transición
- [ ] Navegación con tabs (TabBar)
- [ ] Navegación con drawer (Sidebar)
- [ ] Paso de parámetros entre pantallas
- [ ] Guards de navegación (autenticación)

## 🎯 Estado
✅ **Completado** - Navegación entre 3 pantallas implementada

---
*Proyecto del curso Flutter - Día 4 - By Jhon Jesus Quispe Machaca*
