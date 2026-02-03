// Test unitarios y de widgets para los ejercicios

import 'package:flutter_test/flutter_test.dart';

import 'package:leccion_paspuel_hernandez/main.dart';
import 'package:leccion_paspuel_hernandez/services/viaje_service.dart';
import 'package:leccion_paspuel_hernandez/services/capicua_service.dart';

void main() {
  // PRUEBA UNITARIA - EJERCICIO 3
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
      },
    );
  });

  // PRUEBA UNITARIA - EJERCICIO 4
  group('CapicuaService', () {
    late CapicuaService capicuaService;

    setUp(() {
      capicuaService = CapicuaService();
    });

    test(
      'esCapicua: 121 debe ser capicúa',
      () {
        const numero = 121;
        final resultado = capicuaService.esCapicua(numero);

        expect(resultado, true);
      },
    );
  });

  // PRUEBA DE WIDGET - EJERCICIO 3
  group('Widget Tests - Ejercicio 3', () {
    testWidgets('Ejercicio3Screen renders with input and calculate button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      // Navegar a ejercicio 3
      await tester.tap(find.text('Ejercicio 3'));
      await tester.pumpAndSettle();

      // Verificar que la pantalla contiene los elementos esperados
      expect(find.text('Ejercicio 3: Costo del Viaje'), findsOneWidget);
      expect(find.text('Calcular Costo'), findsOneWidget);
    });
  });

  // PRUEBA DE WIDGET - EJERCICIO 4
  group('Widget Tests - Ejercicio 4', () {
    testWidgets('Ejercicio4CapicuaScreen renders with input and verify button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      // Navegar a ejercicio 4
      await tester.tap(find.text('Ejercicio 4'));
      await tester.pumpAndSettle();

      // Verificar que la pantalla contiene los elementos esperados
      expect(find.text('Ejercicio 4: Número Capicúa'), findsOneWidget);
      expect(find.text('Verificar'), findsOneWidget);
    });
  });

  // PRUEBA DE WIDGET - NAVEGACIÓN
  group('Widget Tests', () {
    testWidgets('HomeScreen renders with navigation buttons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      // Verificar que la pantalla principal contiene el texto
      expect(find.text('Selecciona un ejercicio'), findsOneWidget);

      // Verificar que los botones de navegación existen
      expect(find.text('Ejercicio 3'), findsOneWidget);
      expect(find.text('Ejercicio 4'), findsOneWidget);
    });
  });
}
