import '../entities/dashboard_overview.dart';

/// Contrato que la capa data debe implementar. El domain no sabe
/// (ni le importa) si los datos vienen de una API, una base local, etc.
abstract class DashboardRepository {
  Future<DashboardOverview> getOverview();
}
