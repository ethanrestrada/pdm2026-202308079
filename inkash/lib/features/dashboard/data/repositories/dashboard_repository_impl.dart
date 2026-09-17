import '../../domain/entities/category.dart';
import '../../domain/entities/dashboard_overview.dart';
import '../../domain/entities/hero_highlight.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_data_source.dart';
import '../models/movement_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource localDataSource;
  final CategoryRepository categoryRepository;

  const DashboardRepositoryImpl(this.localDataSource, this.categoryRepository);

  @override
  Future<DashboardOverview> getOverview() async {
    final saludo = await localDataSource.getSaludo();
    final periodo = await localDataSource.getPeriodo();
    final budget = await localDataSource.getBudgetSummary();
    final rawHighlights = await localDataSource.getHeroHighlights();
    final movementRows = await localDataSource.getMovements();

    // Los movimientos solo traen un categoryId; aquí se resuelve contra
    // las categorías reales que viven en SQLite (tabla `categories`).
    final categories = await categoryRepository.getAll();
    final categoriesById = <int, Category>{
      for (final category in categories) category.id: category,
    };

    final movements = movementRows.map((row) {
      final category = categoriesById[row.categoryId];
      if (category == null) {
        throw StateError(
          'No existe categoría con id ${row.categoryId} '
          'para el movimiento "${row.title}"',
        );
      }
      return MovementModel.fromRow(row, category);
    }).toList();

    return DashboardOverview(
      saludo: saludo,
      periodo: periodo,
      budget: budget,
      heroHighlights: rawHighlights
          .map((h) => HeroHighlight(title: h['title'], value: h['value']))
          .toList(),
      movements: movements,
    );
  }
}
