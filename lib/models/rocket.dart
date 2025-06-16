import 'package:intl/intl.dart';

// Rocket class 

class Rocket {
  final String id;
  final String nombre;
  final String descripcion;
  final String responsable;
  final String nombreLan;
  final String fechaLan;
  final String estado;
  final String foto;

  Rocket({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.responsable,
    required this.nombreLan,
    required this.fechaLan,
    required this.estado,
    required this.foto,
  });

  // Función para mapear una respuesta JSON recibida de la API
  factory Rocket.fromJson(Map<String, dynamic> json) {
    // Formato de fecha
    final DateFormat formatter = DateFormat('HH:mm:ss dd-MM-yyyy');
    return Rocket(
      id: json['id'],
      nombre: json['name'] ?? 'Sin nombre',
      descripcion: json['status']['description'] ?? 'Sin descripción',
      responsable: json['lsp_name'] ?? 'Desconocido',
      nombreLan: json['name'] ?? 'Fecha no disponible',
      // Fecha formateada
      fechaLan: formatter.format(DateTime.parse(json['net'])),
      estado: json['status']['name'] ?? 'Sin estado',
      foto: json['image'] ?? '',
    );
  }
}
