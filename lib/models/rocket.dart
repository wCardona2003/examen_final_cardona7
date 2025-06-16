
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

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'],
      nombre: json['name'],
      descripcion: json['status']['description'] ?? 'Sin descripción',
      responsable: json['lsp_name'] ?? 'Desconocido',
      nombreLan: json['name'] ?? 'Fecha no disponible',
      fechaLan: json['window_start'] ?? 'Fecha no disponible',
      estado: json['status']['name'] ?? 'Sin estado',
      foto: json['image'] ?? '',
    );
  }
}
