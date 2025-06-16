import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rocket.dart';

// Clase para gestión de la API
class RocketService {
  final String baseUrl = 'https://lldev.thespacedevs.com/2.2.0/launch/upcoming/?mode=list';

  // OBTENER TODOS
  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> results = decoded['results'];

      return results.map((rocketJson) => Rocket.fromJson(rocketJson)).toList();
    } else {
      throw Exception('Error cargando cohetes: ${response.statusCode}');
    }
  }
}
