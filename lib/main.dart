import 'package:flutter/material.dart';

// ColorChangeWidget es un StatefulWidget que muestra un contenedor que cambia de color al ser tocado.
class ColorChangeWidget extends StatefulWidget {
  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  // Define el color inicial del contenedor.
  Color _currentColor = Colors.blue;

  // Lista de colores disponibles para alternar.
  List<Color> _availableColors = [Colors.blue, Colors.red];

  // Función para cambiar el color al siguiente de la lista.
  void _changeColor() {
    // Obtener el índice del color actual.
    int currentIndex = _availableColors.indexOf(_currentColor);

    // Obtener el siguiente color.
    int nextIndex = (currentIndex + 1) % _availableColors.length;

    // Actualizar el color del contenedor.
    setState(() {
      _currentColor = _availableColors[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Detecta los toques en el contenedor.
      onTap: () {
        // Cambia el color al ser tocado.
        _changeColor();
      },
      child: Container(
        // Muestra el contenedor con el color actual.
        width: 200,
        height: 200,
        color: _currentColor,
        child: Center(
          child: Text(
            'Tap to Change Color',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// Ejemplo de cómo utilizar ColorChangeWidget en una aplicación.
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Color Change Widget'),
      ),
      body: Center(
        child: ColorChangeWidget(),
      ),
    ),
  ));
}
