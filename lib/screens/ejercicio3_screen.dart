import 'package:flutter/material.dart';
import '../services/viaje_service.dart';

class Ejercicio3Screen extends StatefulWidget {
  const Ejercicio3Screen({super.key});

  @override
  State<Ejercicio3Screen> createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final TextEditingController _controller = TextEditingController();
  double? _costoPorAlumno;
  double? _costoTotal;
  String? _descripcion;

  final ViajeService _viajeService = ViajeService();

  void _calcularCosto() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa el número de alumnos')),
      );
      return;
    }

    try {
      final numAlumnos = int.parse(input);
      if (numAlumnos <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Por favor ingresa un número mayor a cero')),
        );
        return;
      }

      final resultado = _viajeService.calcularCostoViaje(numAlumnos);

      setState(() {
        _costoPorAlumno = resultado['costoPorAlumno'] as double;
        _costoTotal = resultado['costoTotal'] as double;
        _descripcion = resultado['descripcion'] as String;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa un número válido')),
      );
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
      appBar: AppBar(
        title: const Text('Ejercicio 3: Costo del Viaje'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Descripción del Problema:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• 100 o más alumnos: \$65.00 por alumno\n'
                        '• 50 a 99 alumnos: \$70.00 por alumno\n'
                        '• 30 a 49 alumnos: \$95.00 por alumno\n'
                        '• Menos de 30 alumnos: \$4000.00 total',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Número de alumnos',
                  hintText: 'Ingresa la cantidad',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.people),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularCosto,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text('Calcular Costo'),
              ),
              const SizedBox(height: 30),
              if (_costoPorAlumno != null && _costoTotal != null)
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          _descripcion ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Costo por Alumno',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${_costoPorAlumno!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Costo Total',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${_costoTotal!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
