import 'package:flutter/material.dart' show IconData, Color;

/// Categoría de un movimiento (ej. Transporte, Súper y comida).
class Category {
  final int id;
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
