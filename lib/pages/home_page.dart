import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Eliminamos la barra de aplicaciones predeterminada y establecer el color de fondo
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFebf8ff), Color(0xFFcfe3ff)], // De azul claro a azul más claro
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // Alinear elementos al centro
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono de gotas de agua
                Icon(Icons.water_drop, size: 64, color: Colors.blue[500]),
                const SizedBox(height: 16),
                // Título principal
                Text(
                  'Buscador de Pantanos y Embalses',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Contenedor blanco con información
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // Sombra debajo del contenedor
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Subtítulo
                      const Text(
                        '¿Cómo funciona?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Descripción
                      const Text(
                        'Esta aplicación te permite buscar pantanos y embalses en un radio de 100 km de tu ubicación actual. Puedes filtrar los resultados por capacidad y profundidad mínima.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Características principales
                      const Text(
                        'Características principales:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // Lista de características
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• Búsqueda basada en tu ubicación actual', style: TextStyle(fontSize: 16)),
                            Text('• Filtros por capacidad y profundidad', style: TextStyle(fontSize: 16)),
                            Text('• Visualización de resultados en un mapa interactivo', style: TextStyle(fontSize: 16)),
                            Text('• Información detallada de cada pantano o embalse', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Botón para comenzar la búsqueda
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/buscar');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          'Comenzar búsqueda',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
