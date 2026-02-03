// Pruebas adicionales más exhaustivas

import 'package:flutter_test/flutter_test.dart';
import 'package:leccion_paspuel_hernandez/services/viaje_service.dart';
import 'package:leccion_paspuel_hernandez/services/capicua_service.dart';

void main() {
  // ============= PRUEBAS ADICIONALES VIAJE SERVICE =============
  group('ViajeService - Tests Exhaustivos', () {
    late ViajeService viajeService;

    setUp(() {
      viajeService = ViajeService();
    });

    // Prueba 1: Límite inferior - 100 alumnos exacto
    test(
        'Caso límite: 100 alumnos debe costar \$65 por alumno y \$6500 total',
        () {
      const numAlumnos = 100;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 65.00);
      expect(resultado['costoTotal'], 6500.00);
    });

    // Prueba 2: Límite inferior - 50 alumnos exacto
    test(
        'Caso límite: 50 alumnos debe costar \$70 por alumno y \$3500 total',
        () {
      const numAlumnos = 50;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 70.00);
      expect(resultado['costoTotal'], 3500.00);
    });

    // Prueba 3: Límite inferior - 30 alumnos exacto
    test(
        'Caso límite: 30 alumnos debe costar \$95 por alumno y \$2850 total',
        () {
      const numAlumnos = 30;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 95.00);
      expect(resultado['costoTotal'], 2850.00);
    });

    // Prueba 4: Menos de 30 alumnos - un solo alumno
    test('Caso extremo: 1 alumno debe pagar \$4000 (costo fijo)', () {
      const numAlumnos = 1;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoTotal'], 4000.00);
      expect(resultado['costoPorAlumno'], 4000.00);
    });

    // Prueba 5: Menos de 30 alumnos - 20 alumnos
    test('Caso especial: 20 alumnos pagan \$200 cada uno (\$4000 total)', () {
      const numAlumnos = 20;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoTotal'], 4000.00);
      expect(resultado['costoPorAlumno'], 200.00);
    });

    // Prueba 6: Número grande de alumnos
    test('Caso grande: 500 alumnos debe costar \$65 por alumno y \$32500 total',
        () {
      const numAlumnos = 500;
      final resultado = viajeService.calcularCostoViaje(numAlumnos);

      expect(resultado['costoPorAlumno'], 65.00);
      expect(resultado['costoTotal'], 32500.00);
    });

    // Prueba 7: Verificar que los límites son exclusivos/inclusivos correctamente
    test('Verificar límite 49-50: 49 alumnos cuesta \$95, 50 cuesta \$70', () {
      final resultado49 = viajeService.calcularCostoViaje(49);
      final resultado50 = viajeService.calcularCostoViaje(50);

      expect(resultado49['costoPorAlumno'], 95.00);
      expect(resultado50['costoPorAlumno'], 70.00);
    });

    // Prueba 8: Verificar descripción para cada rango
    test('Verificar descripciones correctas para cada rango', () {
      final resultado100 = viajeService.calcularCostoViaje(100);
      final resultado75 = viajeService.calcularCostoViaje(75);
      final resultado40 = viajeService.calcularCostoViaje(40);
      final resultado20 = viajeService.calcularCostoViaje(20);

      expect(resultado100['descripcion'], 'Grupo de 100 o más alumnos');
      expect(resultado75['descripcion'], 'Grupo de 50 a 99 alumnos');
      expect(resultado40['descripcion'], 'Grupo de 30 a 49 alumnos');
      expect(resultado20['descripcion'], 'Grupo menor a 30 alumnos (renta fija)');
    });
  });

  // ============= PRUEBAS ADICIONALES CAPICUA SERVICE =============
  group('CapicuaService - Tests Exhaustivos', () {
    late CapicuaService capicuaService;

    setUp(() {
      capicuaService = CapicuaService();
    });

    // Prueba 1: Números de un dígito (siempre son capicúa)
    test('Números de un dígito son siempre capicúa', () {
      for (int i = 0; i <= 9; i++) {
        expect(capicuaService.esCapicua(i), true,
            reason: '$i debe ser capicúa');
      }
    });

    // Prueba 2: Números de dos dígitos iguales
    test('Números de dos dígitos iguales son capicúa (11, 22, 33...)', () {
      expect(capicuaService.esCapicua(11), true);
      expect(capicuaService.esCapicua(22), true);
      expect(capicuaService.esCapicua(99), true);
    });

    // Prueba 3: Números de dos dígitos diferentes
    test('Números de dos dígitos diferentes NO son capicúa', () {
      expect(capicuaService.esCapicua(10), false);
      expect(capicuaService.esCapicua(12), false);
      expect(capicuaService.esCapicua(98), false);
    });

    // Prueba 4: Números de tres dígitos capicúa
    test('121, 131, 141... deben ser capicúa', () {
      expect(capicuaService.esCapicua(121), true);
      expect(capicuaService.esCapicua(131), true);
      expect(capicuaService.esCapicua(141), true);
      expect(capicuaService.esCapicua(505), true);
    });

    // Prueba 5: Números de cuatro dígitos capicúa
    test('1221, 1331, 1441... deben ser capicúa', () {
      expect(capicuaService.esCapicua(1221), true);
      expect(capicuaService.esCapicua(1331), true);
      expect(capicuaService.esCapicua(1441), true);
    });

    // Prueba 6: Números de cinco dígitos capicúa
    test('12321, 54345... deben ser capicúa', () {
      expect(capicuaService.esCapicua(12321), true);
      expect(capicuaService.esCapicua(54345), true);
      expect(capicuaService.esCapicua(99999), true);
    });

    // Prueba 7: Números que NO son capicúa
    test('123, 456, 789... NO deben ser capicúa', () {
      expect(capicuaService.esCapicua(123), false);
      expect(capicuaService.esCapicua(456), false);
      expect(capicuaService.esCapicua(789), false);
      expect(capicuaService.esCapicua(1234), false);
    });

    // Prueba 8: Comparar ambos métodos
    test('Los dos métodos (esCapicua y esCapicuaAlternativo) dan el mismo resultado',
        () {
      final numeros = [121, 123, 1331, 456, 12321, 789];

      for (final num in numeros) {
        expect(capicuaService.esCapicua(num),
            capicuaService.esCapicuaAlternativo(num),
            reason: 'Los métodos deben coincidir para $num');
      }
    });

    // Prueba 9: Números con ceros
    test('Números con ceros como 101, 202, 303 son capicúa', () {
      expect(capicuaService.esCapicua(101), true);
      expect(capicuaService.esCapicua(202), true);
      expect(capicuaService.esCapicua(303), true);
      expect(capicuaService.esCapicua(1001), true);
    });

    // Prueba 10: Números grandes capicúa
    test('Números grandes capicúa como 9119, 123454321', () {
      expect(capicuaService.esCapicua(9119), true);
      expect(capicuaService.esCapicua(123454321), true);
      expect(capicuaService.esCapicua(1234554321), true);
    });
  });
}
