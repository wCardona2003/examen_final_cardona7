class Rocket {
  final String nombre;
  final String descripcion;
  final String responsable;
  final String fechaLan;
  final String estado;
  final String foto;


  Rocket({
    required this.nombre,
    required this.descripcion,
    required this.responsable,
    required this.fechaLan,
    required this.estado,
    required this.foto,

  });

  // Función para leer un JSON obtenido de API y mapearlo a un objeto
  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      nombre: json['results']['name'],
      descripcion: json['results']['status']['description'],
      responsable: json['results']['lsp_name'],
      fechaLan: json['results']['window_start'],
      estado: json['results']['status']['name'],
      foto: json['results']['image'],
    );
  }
}

