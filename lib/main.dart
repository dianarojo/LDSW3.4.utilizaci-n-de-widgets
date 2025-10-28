import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo de Películas'),
        ),
        body: const MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Mis Películas Favoritas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: const Text('Acción'),
            ),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: const Text('Comedia'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Container(
              height: 150,
              color: Colors.grey[300],
            ),
            const Positioned(
              bottom: 10,
              left: 10,
              child: Text('Película Destacada'),
            ),
          ],
        ),
      ],
    );
  }
}
