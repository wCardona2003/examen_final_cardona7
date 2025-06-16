import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rocket.dart';

// Clase para gestión de la API
class RocketService {
  final String baseUrl = 'https://caf8dc5fef65f19a21a4.free.beeceptor.com/api/countries/';

  // OBTENER TODOS
  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((RocketJson) => Rocket.fromJson(RocketJson)).toList();
    } else {
      throw Exception('Error cargando países');
    }
  }
}
