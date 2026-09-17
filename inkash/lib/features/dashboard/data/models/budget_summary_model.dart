import '../../domain/entities/budget_summary.dart';

class BudgetSummaryModel extends BudgetSummary {
  const BudgetSummaryModel({
    required super.disponible,
    required super.usado,
    required super.total,
  });

  factory BudgetSummaryModel.fromMap(Map<String, dynamic> map) {
    return BudgetSummaryModel(
      disponible: (map['disponible'] as num).toDouble(),
      usado: (map['usado'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
    );
  }
}
