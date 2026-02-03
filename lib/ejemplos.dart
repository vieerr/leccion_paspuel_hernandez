// Ejemplos de uso de los servicios implementados

import 'package:leccion_paspuel_hernandez/services/viaje_service.dart';
import 'package:leccion_paspuel_hernandez/services/chapico_service.dart';

void ejemplosViajeService() {
  final viajeService = ViajeService();

  // Ejemplo 1: Calcular costo para 150 alumnos
  var resultado = viajeService.calcularCostoViaje(150);
  print('Alumnos: 150');
  print('Costo por alumno: \$${resultado['costoPorAlumno']}');
  print('Costo total: \$${resultado['costoTotal']}');
  print('Descripción: ${resultado['descripcion']}');
  print('---');

  // Ejemplo 2: Calcular costo para 75 alumnos
  resultado = viajeService.calcularCostoViaje(75);
  print('Alumnos: 75');
  print('Costo por alumno: \$${resultado['costoPorAlumno']}');
  print('Costo total: \$${resultado['costoTotal']}');
  print('Descripción: ${resultado['descripcion']}');
  print('---');

  // Ejemplo 3: Calcular costo para 40 alumnos
  resultado = viajeService.calcularCostoViaje(40);
  print('Alumnos: 40');
  print('Costo por alumno: \$${resultado['costoPorAlumno']}');
  print('Costo total: \$${resultado['costoTotal']}');
  print('Descripción: ${resultado['descripcion']}');
  print('---');

  // Ejemplo 4: Calcular costo para 25 alumnos (menos de 30)
  resultado = viajeService.calcularCostoViaje(25);
  print('Alumnos: 25');
  print('Costo por alumno: \$${resultado['costoPorAlumno']}');
  print('Costo total: \$${resultado['costoTotal']}');
  print('Descripción: ${resultado['descripcion']}');
}

void ejemplosChapicoService() {
  final chapicoService = ChapicoService();

  // Ejemplo 1: Verificar si 121 es chapico
  print('¿121 es chapico? ${chapicoService.esChapico(121)}'); // true

  // Ejemplo 2: Verificar si 1331 es chapico
  print('¿1331 es chapico? ${chapicoService.esChapico(1331)}'); // true

  // Ejemplo 3: Verificar si 12321 es chapico
  print('¿12321 es chapico? ${chapicoService.esChapico(12321)}'); // true

  // Ejemplo 4: Verificar si 123 NO es chapico
  print('¿123 es chapico? ${chapicoService.esChapico(123)}'); // false

  // Ejemplo 5: Verificar si 7 es chapico
  print('¿7 es chapico? ${chapicoService.esChapico(7)}'); // true

  // Ejemplo 6: Usar el método alternativo
  print('¿121 es chapico (alternativo)? ${chapicoService.esChapicoAlternativo(121)}'); // true
}

void main() {
  print('====== EJEMPLOS VIAJE SERVICE ======');
  ejemplosViajeService();

  print('\n====== EJEMPLOS CHAPICO SERVICE ======');
  ejemplosChapicoService();
}
