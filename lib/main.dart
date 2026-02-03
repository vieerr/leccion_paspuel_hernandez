import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/ejercicio3_screen.dart';
import 'screens/ejercicio4_capicua_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios Grupo 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/ejercicio3': (context) => const Ejercicio3Screen(),
        '/ejercicio4': (context) => const Ejercicio4CapicuaScreen(),
      },
    );
  }
}

