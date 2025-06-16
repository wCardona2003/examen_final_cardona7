import 'package:flutter/material.dart';
import '../screens/rocket_screen.dart';
import '../services/rocket_service.dart';
import '../models/rocket.dart';

// Pantalla inicial
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RocketService rocketService = RocketService();
  late Future<List<Rocket>> futureRockets;

  @override
  void initState() {
    super.initState();
    // Cargamos los Rockets
    futureRockets = RocketService.fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Países')),
      // Botón para añadir un país nuevo
      body: FutureBuilder<List<Rocket>>(
        future: futureRockets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Creamos un circulo de carga
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error al cargar
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Si no hay datos
            return const Center(child: Text('No hay países disponibles'));
          }

          // Variable de Rockets
          final Rockets = snapshot.data!;

          // Creamos nuestra lista de Rockets dependiendo de la cantidad de Rockets recibidos por la API
          return ListView.builder(
            itemCount: Rockets.length,
            itemBuilder: (context, index) {
              final Rocket = Rockets[index];
              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // Añadimos un GestureDetector para detectar si se pulsa la imagen del país
                    GestureDetector(
                      onTap: () async {
                        final eliminado = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            // Abrimos pantalla del país
                            builder: (_) => RocketDetailScreen(Rocket: Rocket),
                          ),
                        );

                        if (eliminado == true) {
                          setState(() {
                            futureRockets = RocketService.fetchRockets();
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          Rocket.foto,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 80),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(Rocket.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(Rocket.descripcion),
                      onTap: () async {
                        final eliminado = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RocketDetailScreen(Rocket: Rocket),
                          ),
                        );

                        if (eliminado == true) {
                          setState(() {
                            futureRockets = RocketService.fetchRockets();
                          });
                        }
                      }
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}