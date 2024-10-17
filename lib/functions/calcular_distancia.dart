import 'dart:math';

// Función para calcular la distancia usando la fórmula de Haversine
double calcularDistancia(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371; // Radio de la Tierra en kilómetros
  double dLat = _gradoARadianes(lat2 - lat1);
  double dLon = _gradoARadianes(lon2 - lon1);
  double sinLat = sin(dLat / 2);
  double sinLon = sin(dLon / 2);
  double a = sinLat * sinLat +
      cos(_gradoARadianes(lat1)) *
          cos(_gradoARadianes(lat2)) *
          sinLon * sinLon;
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return R * c; // La distancia resultante
}

double semiPi = pi / 180;

double _gradoARadianes(double grados) {
  return grados * semiPi;
}