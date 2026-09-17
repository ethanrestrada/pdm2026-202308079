/// Resumen del presupuesto disponible del período actual.
class BudgetSummary {
  final double disponible;
  final double usado;
  final double total;

  const BudgetSummary({
    required this.disponible,
    required this.usado,
    required this.total,
  });

  /// Progreso de uso del presupuesto, normalizado entre 0.0 y 1.0.
  double get progreso => total <= 0 ? 0 : (usado / total).clamp(0.0, 1.0);
}
