# Ejercicios Grupo 2 - Aplicación Flutter

Esta es una aplicación móvil Flutter que contiene la solución para dos ejercicios académicos.

## 📋 Ejercicios Implementados

### Ejercicio 3: Cálculo del Costo del Viaje de Estudios

**Descripción del Problema:**
El director de una escuela está organizando un viaje de estudios y necesita determinar cuánto debe cobrar a cada alumno y cuánto debe pagar a la compañía de viajes.

**Tarifa de Costos:**
- **100 o más alumnos:** $65.00 por alumno
- **50 a 99 alumnos:** $70.00 por alumno
- **30 a 49 alumnos:** $95.00 por alumno
- **Menos de 30 alumnos:** $4000.00 total (costo fijo)

**Conceptos Utilizados:**
- ✅ Condicionales (if-else)
- ✅ Operaciones aritméticas
- ✅ Validación de entrada
- ✅ Interfaz de usuario interactiva

**Casos de Prueba:**
1. 150 alumnos → $65.00 por alumno, $9750.00 total
2. 40 alumnos → $95.00 por alumno, $3800.00 total

---

### Ejercicio 4: Verificación de Número Chapico (Capicúa)

**Descripción del Problema:**
Evaluar si un número es "chapico" (capicúa). Un número chapico es aquel que se lee igual de izquierda a derecha que de derecha a izquierda.

**Ejemplos:**
- ✅ Chapico: 121, 1331, 12321, 9119, 7
- ❌ No Chapico: 123, 456, 789

**Conceptos Utilizados:**
- ✅ Ciclos repetitivos (for)
- ✅ Manipulación de strings
- ✅ Condicionales
- ✅ Comparación de caracteres

**Casos de Prueba:**
1. 121 → true (es chapico)
2. 123 → false (no es chapico)

**Nota:** La pantalla del Ejercicio 4 es un placeholder con navegación funcionando correctamente.

---

## 🏗️ Arquitectura de la Aplicación

```
lib/
├── main.dart                 # Configuración principal y rutas
├── screens/
│   ├── home_screen.dart      # Pantalla principal con botones de navegación
│   ├── ejercicio3_screen.dart # Implementación del Ejercicio 3
│   └── ejercicio4_screen.dart # Placeholder del Ejercicio 4
└── services/
    ├── viaje_service.dart    # Lógica de negocio para Ejercicio 3
    └── chapico_service.dart  # Lógica de negocio para Ejercicio 4

test/
└── widget_test.dart          # Pruebas unitarias y de widgets
```

---

## 🧪 Pruebas Unitarias y Widgets

Se han implementado **6 pruebas** en total:

### Pruebas Unitarias (4 casos):
1. **ViajeService Test 1:** Validar cálculo para 150 alumnos
2. **ViajeService Test 2:** Validar cálculo para 40 alumnos
3. **ChapicoService Test 1:** Validar número chapico (121)
4. **ChapicoService Test 2:** Validar número no chapico (123)

### Pruebas de Widgets (2 casos):
1. **HomeScreen Test:** Verificar que la pantalla principal se renderiza correctamente con botones de navegación
2. **Navegación Test:** Verificar que se puede navegar al Ejercicio 3

### Ejecutar las Pruebas:
```bash
flutter test
```

---

## 🎨 Características de la Interfaz

- **Diseño Material 3:** Utiliza el nuevo diseño Material de Flutter
- **Navegación entre pantallas:** Sistema de rutas implementado
- **Validación de entrada:** Validación de datos en formularios
- **Interfaz responsive:** Se adapta a diferentes tamaños de pantalla
- **Feedback visual:** Mensajes y alertas para el usuario

---

## 🚀 Cómo Ejecutar la Aplicación

### Requisitos:
- Flutter 3.10.7 o superior
- Dart 3.10.7 o superior

### Pasos:
1. **Clonar o descargar el proyecto**
```bash
cd leccion_paspuel_hernandez
```

2. **Obtener dependencias**
```bash
flutter pub get
```

3. **Ejecutar la aplicación**
```bash
flutter run
```

4. **Ejecutar las pruebas**
```bash
flutter test
```

---

## 📱 Flujo de la Aplicación

```
HomeScreen
    ↓
    ├─→ Ejercicio 3 (Costo del Viaje)
    │    ├─ Ingresa número de alumnos
    │    ├─ Calcula costo por alumno
    │    └─ Muestra costo total
    │
    └─→ Ejercicio 4 (Número Chapico)
         └─ Placeholder con descripción
```

---

## 📊 Conceptos de Programación Implementados

### Condicionales (if-else)
- Utilizados en ambos ejercicios para tomar decisiones
- Evaluación de rangos de números (Ejercicio 3)
- Validación de entrada de usuarios

### Ciclos Repetitivos (for)
- Implementados en `ChapicoService.esChapico()` para comparar caracteres
- Optimizado con `numStr.length ~/ 2` para evitar comparaciones innecesarias

### Rutas y Navegación
- Sistema de rutas con `Navigator.pushNamed()`
- Definición de rutas en `main.dart`
- Navegación entre pantallas fluida

### Servicios (Business Logic)
- Separación de lógica de negocio en servicios
- `ViajeService` para cálculos del viaje
- `ChapicoService` para validación de números chapicos

---

## ✅ Requisitos Cumplidos

- ✅ Diseño de app móvil con Flutter
- ✅ Uso de ciclos repetitivos
- ✅ Uso de condicionales
- ✅ Implementación de rutas/navegación
- ✅ Pruebas unitarias (4 casos)
- ✅ Pruebas de widgets (2 casos)
- ✅ Ejercicio 4 con placeholder navegable

---

## 📝 Notas Adicionales

- La aplicación utiliza el patrón **Service Pattern** para separar la lógica de negocio
- El código es totalmente documentado y fácil de entender
- Las pruebas cumplen con las mejores prácticas de Flutter
- La interfaz es intuitiva y amigable con el usuario

---

**Autor:** Grupo 2  
**Fecha:** 2026  
**Versión:** 1.0.0
