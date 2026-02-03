import 'package:flutter/material.dart';
import '../services/capicua_service.dart';

class Ejercicio4CapicuaScreen extends StatefulWidget {
  const Ejercicio4CapicuaScreen({super.key});

  @override
  State<Ejercicio4CapicuaScreen> createState() =>
      _Ejercicio4CapicuaScreenState();
}

class _Ejercicio4CapicuaScreenState extends State<Ejercicio4CapicuaScreen> {
  final TextEditingController _controller = TextEditingController();
  bool? _esCapicua;
  String? _numeroIngresado;
  String? _explicacion;

  final CapicuaService _capicuaService = CapicuaService();

  void _verificarCapicua() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa un número')),
      );
      return;
    }

    try {
      final numero = int.parse(input);
      if (numero < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor ingresa un número positivo')),
        );
        return;
      }

      final resultado = _capicuaService.esCapicua(numero);
      final numStr = numero.toString();
      
      String generarExplicacion(String numStr, bool esCapicua) {
        // Recorrer el número y mostrar la comparación
        StringBuffer explicacion = StringBuffer();
        explicacion.write('Comparando caracteres:\n\n');
        
        // Mostrar el número y su reverso
        explicacion.write('Número: $numStr\n');
        String reverso = '';
        for (int i = numStr.length - 1; i >= 0; i--) {
          reverso += numStr[i];
        }
        explicacion.write('Reverso: $reverso\n\n');
        
        // Hacer comparaciones carácter por carácter
        for (int i = 0; i < numStr.length ~/ 2; i++) {
          int posicionFinal = numStr.length - 1 - i;
          String coincide = numStr[i] == numStr[posicionFinal] ? '✓' : '✗';
          explicacion.write('Posición $i: \'${numStr[i]}\' == \'${numStr[posicionFinal]}\' $coincide\n');
        }
        
        return explicacion.toString();
      }

      setState(() {
        _esCapicua = resultado;
        _numeroIngresado = numStr;
        _explicacion = generarExplicacion(numStr, resultado);
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
        title: const Text('Ejercicio 4: Número Capicúa'),
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
                        'Un número capicúa (palíndromo) es un número que se lee igual de izquierda a derecha que de derecha a izquierda.\n\n'
                        'Ejemplos:\n'
                        '✓ 121 (uno-dos-uno)\n'
                        '✓ 1331 (uno-tres-tres-uno)\n'
                        '✓ 12321 (uno-dos-tres-dos-uno)\n'
                        '✓ 9119\n'
                        '✗ 123 (no es capicúa)',
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
                  labelText: 'Ingresa un número',
                  hintText: 'Ejemplo: 121',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.numbers),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verificarCapicua,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text('Verificar'),
              ),
              const SizedBox(height: 30),
              if (_esCapicua != null)
                Column(
                  children: [
                    // Card con resultado
                    Card(
                      elevation: 5,
                      color: _esCapicua! ? Colors.green[50] : Colors.red[50],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _esCapicua! ? Icons.check_circle : Icons.cancel,
                                  color: _esCapicua! ? Colors.green : Colors.red,
                                  size: 40,
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _numeroIngresado ?? '',
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _esCapicua! ? 'Es capicúa' : 'No es capicúa',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: _esCapicua! ? Colors.green : Colors.red,
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
                    const SizedBox(height: 20),
                    // Card con explicación
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Proceso de Verificación:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _explicacion ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'monospace',
                                height: 1.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
