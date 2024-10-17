import 'package:flutter/material.dart';
import 'package:hackaton/services/embalses_services.dart';

class EmbalsesPage extends StatefulWidget {
  const EmbalsesPage({super.key});

  @override
  _EmbalsesPageState createState() => _EmbalsesPageState();
}

class _EmbalsesPageState extends State<EmbalsesPage> {
  List<dynamic> embalse = [];

  @override
  void initState() {
    super.initState();
    _loadEmbalses();
  }

  Future<void> _loadEmbalses() async {
    try {
      final pokemonService = EmbalseService();
      final fetchedPokemons = await pokemonService.fetchEmbalses();
      setState(() {
        embalse = fetchedPokemons;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Embalses'),
      ),
      body: embalse.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: embalse.length,
              itemBuilder: (context, index) {
                final embalses = embalse[index];
                return ListTile(
                  title: Text(embalses['ambito_nombre'] ?? 'Sin nombre'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre embalse: ${embalses['embalse_nombre']}'),
                      Text('Agua total: ${embalses['agua_total']}'),
                      Text('Electrico: ${embalses['electrico_flag']}'),
            
                    ],
                  ),
                );
              },
            ),
    );
  }
}
