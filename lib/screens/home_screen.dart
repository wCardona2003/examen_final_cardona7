import 'package:flutter/material.dart';
import '../models/rocket.dart';
import '../services/rocket_service.dart';
import '../screens/rocket_screen.dart';
import 'package:intl/intl.dart';

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
    // Cargamos los rockets
    futureRockets = rocketService.fetchRockets();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cohetes')),
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

          // Variable de rockets
          final rockets = snapshot.data!;

          // Creamos nuestra lista de rockets dependiendo de la cantidad de rockets recibidos por la API
          return ListView.builder(
            itemCount: rockets.length,
            itemBuilder: (context, index) {
              final rocket = rockets[index];
              final DateFormat formatter = DateFormat('HH:mm:ss dd-MM-yyyy');
              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(rocket.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(rocket.nombre + "\n" + formatter.format(DateTime.parse(rocket.fechaLan))),
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RocketDetailScreen(rocket: rocket)),
                        );
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