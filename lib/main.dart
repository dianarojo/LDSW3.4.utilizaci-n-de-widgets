import 'package:flutter/material.dart';
import 'screens/pokemon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PokemonScreen(),
    );
  }
}
