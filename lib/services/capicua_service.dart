class CapicuaService {
  /// Verifica si un número es capicúa usando un loop simple
  /// Un número es capicúa si se lee igual de izquierda a derecha
  /// que de derecha a izquierda
  bool esCapicua(int numero) {
    // Convertir el número a string
    String numStr = numero.toString();
    
    // Comparar caracteres desde los extremos hacia el centro
    for (int i = 0; i < numStr.length ~/ 2; i++) {
      int posicionFinal = numStr.length - 1 - i;
      
      // Si los caracteres no son iguales, no es capicúa
      if (numStr[i] != numStr[posicionFinal]) {
        return false;
      }
    }
    
    return true;
  }
  
  /// Verifica si un número es capicúa usando un loop simple (método alternativo)
  bool esCapicuaAlternativo(int numero) {
    String numStr = numero.toString();
    String reversed = numStr.split('').reversed.join('');
    return numStr == reversed;
  }
}
