import 'package:flutter/material.dart';
import '../models/rocket.dart';
import '../services/rocket_service.dart';

// Pantalla para mostrar el cohete
class RocketDetailScreen extends StatelessWidget {
  final Rocket rocket;
  final RocketService rocketService = RocketService();

  RocketDetailScreen({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.nombre),
        actions: [
        ],
      ),
      body: Column(
        children: [
          //Foto del cohete
          Image.network(
            rocket.foto,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Lista de elementos del cohete
          ListTile(title: Text('Nombre: ${rocket.nombre}')),
          ListTile(title: Text('Descripción: ${rocket.descripcion}')),
          ListTile(title: Text('Agencia responsable: ${rocket.responsable}')),
          ListTile(title: Text('Fecha de lanzamiento: ${rocket.fechaLan}')),
          ListTile(title: Text('Estado: ${rocket.estado}')),
        ],
      ),
    );
  }
}
