import 'category.dart';

/// Representa un movimiento (ingreso o gasto) del historial.
class Movement {
  final Category category;
  final String title;
  final String medioPago; // ej. "Tarjeta", "Banco", "Efectivo"
  final String amountLabel;
  final String date;
  final bool isIncome;

  const Movement({
    required this.category,
    required this.title,
    required this.medioPago,
    required this.amountLabel,
    required this.date,
    this.isIncome = false,
  });
}
