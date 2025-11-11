import 'package:flutter/material.dart';
import '../services/poke_api_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final _controller = TextEditingController();
  final _service = PokeApiService();
  Pokemon? _pokemon;
  String? _error;
  bool _loading = false;

  Future<void> _buscar() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;
    setState(() {
      _loading = true;
      _error = null;
      _pokemon = null;
    });

    try {
      final p = await _service.fetchPokemon(query);
      setState(() {
        _pokemon = p;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Pokemon')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (_) => _buscar(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loading ? null : _buscar,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (_pokemon != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        '${_pokemon!.name.toUpperCase()}  (#${_pokemon!.id})',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      if (_pokemon!.spriteUrl != null)
                        Image.network(_pokemon!.spriteUrl!)
                      else
                        const Text('Imagen no disponible'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
