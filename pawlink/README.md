# PawLink (Flutter) — Guía completa para integrar el prototipo

Este repositorio ahora está pensado para ayudarte **paso a paso** si ya creaste tu proyecto Flutter (como en tu captura con carpetas `android`, `ios`, `lib`, etc.).

## 1) ¿Qué archivo necesitas copiar?

Para ver el prototipo funcionando, lo principal es:

- `lib/main.dart` → contiene toda la interfaz del mockup.

Opcionalmente, revisa:

- `pubspec.yaml` → solo para confirmar dependencias mínimas.

---

## 2) ¿En dónde pego el código en tu proyecto actual?

En tu proyecto `pawlink` (el de tu captura), haz esto:

1. Abre la carpeta `lib`.
2. Abre el archivo `main.dart`.
3. **Borra todo su contenido**.
4. **Pega el contenido completo** del `lib/main.dart` de este repositorio.
5. Guarda el archivo.

> Ruta exacta en tu máquina (ejemplo): `pawlink/lib/main.dart`

---

## 3) Revisión rápida de `pubspec.yaml`

Tu `pubspec.yaml` debe tener como mínimo:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
```

Si ya lo tiene, no cambies nada.

---

## 4) Comandos para ejecutar

Desde la raíz del proyecto (`pawlink/`):

```bash
flutter pub get
flutter run
```

---

## 5) ¿Qué pantallas incluye el prototipo?

- Login
- Sign up
- Splash/Main
- Onboarding
- Mapa con pines
- Perfil de mascota

Se muestran en una galería deslizable horizontal para revisar diseño y flujo.

---

## 6) Importante para tu clase

- Este entregable está orientado al **frontend visual**.
- Usa `Image.network` para avanzar rápido con diseño.
- Más adelante pueden migrar a `assets/` locales y conectar APIs del backend.

---

## 7) Siguiente recomendación (cuando quieras)

Cuando ya te funcione esta versión, el siguiente paso ideal es separar código por carpetas:

- `lib/screens/`
- `lib/widgets/`
- `lib/theme/`

Así será más fácil conectar login real, mapa real y reportes con backend.

---

## 8) ¿Por qué te salía raro el diseño (texto enorme y franjas amarillas/negro)?

Si ves texto exageradamente grande o franjas de advertencia amarillas con negro, normalmente es por dos cosas:

1. **Escalado de texto del sistema/navegador** muy alto.
2. **Overflow vertical** (el contenido no cabe en la altura disponible).

En esta versión ya se ajustó el prototipo para:

- fijar el escalado de texto del mockup a un valor estable,
- permitir scroll en formularios largos (login/registro),
- evitar que se rompa visualmente en web/desktop.

Si aún lo ves distinto, compárteme una captura nueva y lo calibro pixel por pixel.
