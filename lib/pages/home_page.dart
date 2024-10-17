import 'package:flutter/material.dart';
import 'package:hackaton/functions/calcular_distancia.dart';

// Modelo para representar un embalse
class Embalse {
  final String nombre;
  final String capacidad;
  final String nivel;
  final double latitud;
  final double longitud;

  Embalse({
    required this.nombre,
    required this.capacidad,
    required this.nivel,
    required this.latitud,
    required this.longitud,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _latitudController = TextEditingController();
  final TextEditingController _longitudController = TextEditingController();
  List<Embalse> _resultados = [];
  bool clicked = false;

  // Datos de ejemplo de embalses
  final List<Embalse> _embalsesEjemplo = [
    Embalse(
      nombre: "Embalse del Ebro",
      capacidad: "540 hm³",
      nivel: "75%",
      latitud: 42.97,
      longitud: -4.05,
    ),
    Embalse(
      nombre: "Embalse de Mequinenza",
      capacidad: "1534 hm³",
      nivel: "82%",
      latitud: 41.37,
      longitud: 0.30,
    ),
    Embalse(
      nombre: "Embalse de Alarcón",
      capacidad: "1118 hm³",
      nivel: "60%",
      latitud: 39.56,
      longitud: -2.15,
    ),
    Embalse(
      nombre: "Embalse de Buendía",
      capacidad: "1639 hm³",
      nivel: "45%",
      latitud: 40.40,
      longitud: -2.76,
    ),
  ];

  void _buscarEmbalses() {
    final double? lat = double.tryParse(_latitudController.text);
    final double? lon = double.tryParse(_longitudController.text);

    if (lat == null || lon == null) {
      // Mostrar un mensaje de error si las entradas no son válidas
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa coordenadas válidas.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Filtrar embalses cercanos basándose en la proximidad
    // Filtrar embalses dentro de 10 km usando la fórmula de Haversine
  List<Embalse> embalsesCercanos = _embalsesEjemplo.where((embalse) {
    double distancia = calcularDistancia(lat, lon, embalse.latitud, embalse.longitud);
    // print('Distancia a ${embalse.nombre}: $distancia km');
    return distancia <= 100; // 10 km de radio
  }).toList();   

    setState(() {
      _resultados = embalsesCercanos;
      clicked = true;
    });
  }

  @override
  void dispose() {
    _latitudController.dispose();
    _longitudController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Embalses'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tarjeta de Información
            Card(
              color: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título y Descripción
                    Row(
                      children: [
                        Icon(
                          Icons.local_florist,
                          color: Colors.green[800],
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Consulta de Embalses',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Bienvenido a la aplicación de consulta de embalses. Aquí podrás obtener información sobre diferentes embalses de agua introduciendo coordenadas geográficas.\nAparecerán abajo los embalses que estén a menos de 100km del punto dado.',
                      style: TextStyle(
                        color: Colors.green[600],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Instrucciones
                    Text(
                      'Para usar esta aplicación, sigue estos pasos:',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '1. Introduce la latitud y longitud en los campos correspondientes.\n'
                      '2. Haz clic en el botón "Buscar".\n'
                      '3. Los resultados aparecerán debajo, mostrando los embalses cercanos a las coordenadas proporcionadas.',
                      style: TextStyle(
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Campos de Entrada
                    Row(
                      children: [
                        CampoLatitud(latitudController: _latitudController),
                        
                        const SizedBox(width: 16.0),

                        CampoLongitud(longitudController: _longitudController),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // Botón de Búsqueda
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _buscarEmbalses,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.green[600],
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Resultados de la Búsqueda
            if (_resultados.isNotEmpty)
              EmbalseCard(resultados: _resultados),
            if (_resultados.isEmpty && clicked)
              const Text(
                'No se encontraron embalses cercanos a las coordenadas proporcionadas.',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CampoLatitud extends StatelessWidget {
  const CampoLatitud({
    super.key,
    required TextEditingController latitudController,
  }) : _latitudController = latitudController;

  final TextEditingController _latitudController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _latitudController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
          labelText: 'Latitud',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

class CampoLongitud extends StatelessWidget {
  const CampoLongitud({
    super.key,
    required TextEditingController longitudController,
  }) : _longitudController = longitudController;

  final TextEditingController _longitudController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _longitudController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
          labelText: 'Longitud',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

class EmbalseCard extends StatelessWidget {
  const EmbalseCard({
    super.key,
    required List<Embalse> resultados,
  }) : _resultados = resultados;

  final List<Embalse> _resultados;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resultados de la búsqueda',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _resultados.length,
              itemBuilder: (context, index) {
                final embalse = _resultados[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    border: Border.all(color: Colors.green[200]!),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        embalse.nombre,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                     const SizedBox(height: 8.0),
                      Text(
                        'Capacidad: ${embalse.capacidad}',
                        style: TextStyle(
                          color: Colors.green[700],
                        ),
                      ),
                      Text(
                        'Nivel actual: ${embalse.nivel}',
                        style: TextStyle(
                          color: Colors.green[700],
                        ),
                      ),
                      Text(
                        'Coordenadas: ${embalse.latitud}, ${embalse.longitud}',
                        style: TextStyle(
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
