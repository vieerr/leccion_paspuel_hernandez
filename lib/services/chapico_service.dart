class ChapicoService {
  /// Verifica si un número es chapico (capicúa)
  /// Un número es chapico si se lee igual de izquierda a derecha
  /// que de derecha a izquierda
  bool esChapico(int numero) {
    // Convertir el número a string para hacer el análisis
    String numStr = numero.toString();
    
    // Usar un ciclo for para comparar caracteres desde el inicio y final
    for (int i = 0; i < numStr.length ~/ 2; i++) {
      int posicionFinal = numStr.length - 1 - i;
      
      // Si los caracteres no son iguales, no es chapico
      if (numStr[i] != numStr[posicionFinal]) {
        return false;
      }
    }
    
    return true;
  }
  
  /// Verifica si un número es chapico usando una alternativa con reversión
  bool esChapicoAlternativo(int numero) {
    String numStr = numero.toString();
    String reversed = numStr.split('').reversed.join('');
    return numStr == reversed;
  }
}
