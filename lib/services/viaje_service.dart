class ViajeService {
  /// Calcula el costo del viaje basado en el número de alumnos
  /// Retorna un Map con costoPorAlumno, costoTotal y descripción
  Map<String, dynamic> calcularCostoViaje(int numAlumnos) {
    double costoPorAlumno;
    double costoTotal;
    String descripcion;

    // Condicionales para determinar el costo
    if (numAlumnos >= 100) {
      costoPorAlumno = 65.00;
      descripcion = 'Grupo de 100 o más alumnos';
    } else if (numAlumnos >= 50 && numAlumnos < 100) {
      costoPorAlumno = 70.00;
      descripcion = 'Grupo de 50 a 99 alumnos';
    } else if (numAlumnos >= 30 && numAlumnos < 50) {
      costoPorAlumno = 95.00;
      descripcion = 'Grupo de 30 a 49 alumnos';
    } else {
      // Menos de 30 alumnos: costo fijo
      costoPorAlumno = 4000.00 / numAlumnos;
      costoTotal = 4000.00;
      descripcion = 'Grupo menor a 30 alumnos (renta fija)';
      return {
        'costoPorAlumno': costoPorAlumno,
        'costoTotal': costoTotal,
        'descripcion': descripcion,
      };
    }

    costoTotal = costoPorAlumno * numAlumnos;

    return {
      'costoPorAlumno': costoPorAlumno,
      'costoTotal': costoTotal,
      'descripcion': descripcion,
    };
  }
}
