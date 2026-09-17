import 'budget_summary.dart';
import 'hero_highlight.dart';
import 'movement.dart';

/// Agregado de todo lo que necesita la pantalla principal del dashboard.
class DashboardOverview {
  final String saludo;
  final String periodo;
  final BudgetSummary budget;
  final List<HeroHighlight> heroHighlights;
  final List<Movement> movements;

  const DashboardOverview({
    required this.saludo,
    required this.periodo,
    required this.budget,
    required this.heroHighlights,
    required this.movements,
  });
}
