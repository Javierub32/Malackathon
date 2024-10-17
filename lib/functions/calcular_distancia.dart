import 'dart:math';

// Función para calcular la distancia usando la fórmula de Haversine
double calcularDistancia(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371; // Radio de la Tierra en kilómetros
  double dLat = _gradoARadianes(lat2 - lat1);
  double dLon = _gradoARadianes(lon2 - lon1);
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_gradoARadianes(lat1)) *
          cos(_gradoARadianes(lat2)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distancia = R * c;
  return distancia;
}

double _gradoARadianes(double grados) {
  return grados * pi / 180;
}