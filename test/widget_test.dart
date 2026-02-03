// Test unitarios y de widgets para los ejercicios

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:leccion_paspuel_hernandez/main.dart';
import 'package:leccion_paspuel_hernandez/services/viaje_service.dart';

void main() {
  // ============= PRUEBA UNITARIA =============
  group('ViajeService', () {
    late ViajeService viajeService;

    setUp(() {
      viajeService = ViajeService();
    });

    // Prueba 1: Verificar cálculo para 100 alumnos (exactamente en el límite)
    test(
        'calcularCostoViaje: 100 alumnos debe costar \$65 por alumno y \$6500 total',
        () {
      const numAlumnos = 100;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 65.00);
      expect(resultado['costoTotal'], 6500.00);
      expect(resultado['descripcion'], 'Grupo de 100 o más alumnos');
    });
  });

  // ============= PRUEBA DE WIDGET =============
  group('Widget Tests', () {
    testWidgets('HomeScreen renders with navigation buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verificar que la pantalla principal contiene el texto
      expect(find.text('Selecciona un ejercicio'), findsOneWidget);

      // Verificar que los botones de navegación existen
      expect(find.text('Ejercicio 3'), findsOneWidget);
      expect(find.text('Ejercicio 4'), findsOneWidget);
    });
  });
}

