import 'dart:convert';
import 'package:http/http.dart' as http;

class EmbalseService {
  final String baseUrl = 'https://gfb6b8e87d5150f-hackaton.adb.eu-madrid-1.oraclecloudapps.com/ords/betatesters/embalsesutf8/';

  Future<List<dynamic>> fetchEmbalses() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Decodificar la respuesta y acceder a la lista de items
    
      final Map<String, dynamic> responseData =  json.decode(utf8.decode(response.bodyBytes));
      return responseData['items']; // Devolver solo la lista de Pokémon
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}


