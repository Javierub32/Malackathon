// models/embalse.dart

class Embalse {
  final int idEmbalse;
  final int idListado;
  final String nombre;
  final double x; // Latitud
  final double y; // Longitud
  final double aguaTotal;
  final String provincia;
  final String ccaa;

  Embalse({
    required this.idEmbalse,
    required this.idListado,
    required this.nombre,
    required this.x,
    required this.y,
    required this.aguaTotal,
    required this.provincia,
    required this.ccaa,
  });

  factory Embalse.fromJson(Map<String, dynamic> json) {
    return Embalse(
      idEmbalse: json['id_embalse'],
      idListado: json['id_listado'],
      nombre: json['nombre'],
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      aguaTotal: (json['agua_total'] as num).toDouble(),
      provincia: json['provincia'],
      ccaa: json['ccaa'],
    );
  }
}
