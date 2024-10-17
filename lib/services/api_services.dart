
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/embalse.dart';

class ApiService {
  final String baseUrl = 'https://gfb6b8e87d5150f-hackaton.adb.eu-madrid-1.oraclecloudapps.com/ords/betatesters/rel_embalse_listado/'; // Reemplaza con tu URL real

  Future<List<Embalse>> fetchEmbalses() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));

      // Asumiendo que la lista de embalses está en 'items'
      List<dynamic> items = data['items'];
      return items.map((json) => Embalse.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar embalses');
    }
  }
}



