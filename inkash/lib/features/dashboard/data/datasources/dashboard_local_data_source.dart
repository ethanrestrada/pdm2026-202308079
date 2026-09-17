import '../models/budget_summary_model.dart';
import '../models/movement_model.dart';

/// Fuente de datos local. Los datos "planos" (saldo, hero cards) siguen
/// hardcodeados; los movimientos ahora referencian un categoryId que se
/// resuelve contra SQLite en el repositorio (ver dashboard_repository_impl).
abstract class DashboardLocalDataSource {
  Future<String> getSaludo();
  Future<String> getPeriodo();
  Future<BudgetSummaryModel> getBudgetSummary();
  Future<List<Map<String, dynamic>>> getHeroHighlights();
  Future<List<MovementRow>> getMovements();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  @override
  Future<String> getSaludo() async => 'Hola, Kevin';

  @override
  Future<String> getPeriodo() async => 'Julio 2026';

  @override
  Future<BudgetSummaryModel> getBudgetSummary() async {
    return BudgetSummaryModel.fromMap({
      'disponible': 2796.50,
      'usado': 3703.50,
      'total': 6500.00,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getHeroHighlights() async {
    return const [
      {'title': 'Cuentas', 'value': 'Q7,810.00'},
      {'title': 'Metas de ahorro', 'value': '3 activas'},
    ];
  }

  @override
  Future<List<MovementRow>> getMovements() async {
    // categoryId corresponde al orden de inserción en AppDatabase._seedCategories:
    // 1 Transporte, 2 Súper y comida, 3 Ingreso, 4 Entretenimiento, 5 Servicios
    final raw = <Map<String, dynamic>>[
      {
        'categoryId': 1,
        'title': 'Uber al trabajo',
        'medioPago': 'Tarjeta',
        'amountLabel': '− Q38.00',
        'date': 'Hoy',
      },
      {
        'categoryId': 2,
        'title': 'Súper La Torre',
        'medioPago': 'Tarjeta',
        'amountLabel': '− Q285.50',
        'date': 'Ayer',
      },
      {
        'categoryId': 3,
        'title': 'Salario quincena',
        'medioPago': 'Banco',
        'amountLabel': '+ Q4,200.00',
        'date': 'Ayer',
        'isIncome': true,
      },
      {
        'categoryId': 4,
        'title': 'Café con Ana',
        'medioPago': 'Efectivo',
        'amountLabel': '− Q65.00',
        'date': 'Ayer',
      },
      {
        'categoryId': 5,
        'title': 'Recibo de luz (EEGSA)',
        'medioPago': 'Banco',
        'amountLabel': '− Q420.00',
        'date': 'Lun 20',
      },
    ];
    return raw.map(MovementRow.fromMap).toList();
  }
}
