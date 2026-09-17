import '../entities/dashboard_overview.dart';
import '../repositories/dashboard_repository.dart';

/// Caso de uso: obtener el resumen completo del dashboard.
class GetDashboardOverview {
  final DashboardRepository repository;

  const GetDashboardOverview(this.repository);

  Future<DashboardOverview> call() => repository.getOverview();
}
