import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentación Joseph',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const PresentationSlider(),
    );
  }
}

class PresentationSlider extends StatefulWidget {
  const PresentationSlider({super.key});

  @override
  State<PresentationSlider> createState() => _PresentationSliderState();
}

class _PresentationSliderState extends State<PresentationSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  
  final List<SlideData> _slides = [
    SlideData(
      title: "¿Quién soy?",
      icon: Icons.person,
      color: Colors.blue,
      content: [
        "👨‍💻 Joseph Calderon Garmendia",
        "🎓 Estudiante en UNSAAC",
        "📧 Usuario: Jos3ph1l",
        "📍 Cusco, Perú",
        "💻 Aprendiendo Flutter & Dart"
      ],
    ),
    SlideData(
      title: "Mis Hobbies",
      icon: Icons.sports_esports,
      color: Colors.green,
      content: [
        "🎮 Programación y desarrollo",
        "⚡ Lenguaje ensamblador",
        "📱 Aplicaciones móviles",
        "🎯 Aprender nuevas tecnologías",
        "🔧 Resolver problemas complejos"
      ],
    ),
    SlideData(
      title: "Mis Proyectos",
      icon: Icons.work,
      color: Colors.orange,
      content: [
        "📱 Crear un sistema automatizado de entrenamiento de Modelos",
        "💾 Embebido para control de gas",
        "🔄 Una agencia virtual de turismo",
        "🎨 Widgets personalizados",
        "🚀 Proyectos universitarios"
      ],
    ),
  ];

  void _nextSlide() {
    if (_currentIndex < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Volver al inicio cuando termine
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousSlide() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Ir al final si estamos en la primera
      _pageController.animateToPage(
        _slides.length - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Presentación'),
        backgroundColor: _slides[_currentIndex].color.withOpacity(0.1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Indicadores de página
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index 
                        ? _slides[_currentIndex].color 
                        : Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          
          // Slides
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return SlideWidget(slide: _slides[index]);
              },
            ),
          ),
          
          // Controles de navegación
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _previousSlide,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Anterior'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black87,
                  ),
                ),
                
                Text(
                  '${_currentIndex + 1} / ${_slides.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                ElevatedButton.icon(
                  onPressed: _nextSlide,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(_currentIndex == _slides.length - 1 ? 'Inicio' : 'Siguiente'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _slides[_currentIndex].color,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SlideWidget extends StatelessWidget {
  final SlideData slide;
  
  const SlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            slide.color.withOpacity(0.1),
            slide.color.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: slide.color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícono principal
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: slide.color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                slide.icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Título
            Text(
              slide.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: slide.color,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 20),
            
            // Contenido
            ...slide.content.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: slide.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class SlideData {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> content;

  SlideData({
    required this.title,
    required this.icon,
    required this.color,
    required this.content,
  });
}