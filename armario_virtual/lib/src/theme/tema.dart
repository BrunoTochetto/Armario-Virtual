import 'package:flutter/material.dart';

const TextStyle estiloTextoNormal = TextStyle(
  color: Colors.black87,
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

ThemeData temaApp = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    bodyLarge: estiloTextoNormal,
    bodyMedium: estiloTextoNormal,
    bodySmall: estiloTextoNormal,
    titleMedium: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
);