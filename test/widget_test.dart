// Test unitarios y de widgets para los ejercicios

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:leccion_paspuel_hernandez/main.dart';
import 'package:leccion_paspuel_hernandez/services/viaje_service.dart';
import 'package:leccion_paspuel_hernandez/services/capicua_service.dart';

void main() {
  // ============= PRUEBAS UNITARIAS - EJERCICIO 3 =============
  group('ViajeService - Ejercicio 3', () {
    late ViajeService viajeService;

    setUp(() {
      viajeService = ViajeService();
    });

    // Caso de prueba 1: Grupo de 100 o más alumnos
    test(
        'calcularCostoViaje: 150 alumnos debe costar \$65 por alumno y \$9750 total',
        () {
      const numAlumnos = 150;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 65.00);
      expect(resultado['costoTotal'], 9750.00);
      expect(resultado['descripcion'], 'Grupo de 100 o más alumnos');
    });

    // Caso de prueba 2: Grupo de 30 a 49 alumnos
    test(
        'calcularCostoViaje: 40 alumnos debe costar \$95 por alumno y \$3800 total',
        () {
      const numAlumnos = 40;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 95.00);
      expect(resultado['costoTotal'], 3800.00);
      expect(resultado['descripcion'], 'Grupo de 30 a 49 alumnos');
    });
  });

  // ============= PRUEBAS UNITARIAS - EJERCICIO 4 =============
  group('CapicuaService - Ejercicio 4', () {
    late CapicuaService capicuaService;

    setUp(() {
      capicuaService = CapicuaService();
    });

    // Caso de prueba 1: Número capicúa válido
    test('esCapicua: 121 debe retornar true', () {
      expect(capicuaService.esCapicua(121), true);
    });

    // Caso de prueba 2: Número no capicúa
    test('esCapicua: 123 debe retornar false', () {
      expect(capicuaService.esCapicua(123), false);
    });
  });

  // ============= PRUEBAS DE WIDGETS =============
  group('Widget Tests', () {
    // Test de widget 1: Verificar que HomeScreen se carga correctamente
    testWidgets('HomeScreen renders with navigation buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verificar que la pantalla principal contiene el texto
      expect(find.text('Selecciona un ejercicio'), findsOneWidget);

      // Verificar que los botones de navegación existen
      expect(find.text('Ejercicio 3'), findsOneWidget);
      expect(find.text('Ejercicio 4'), findsOneWidget);
    });

    // Test de widget 2: Verificar navegación al Ejercicio 3
    testWidgets('Navigate to Ejercicio 3 screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Encontrar y pulsar el botón del Ejercicio 3
      await tester.tap(find.text('Ejercicio 3'));
      await tester.pumpAndSettle();

      // Verificar que se abrió la pantalla correcta
      expect(find.text('Ejercicio 3: Costo del Viaje'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}

