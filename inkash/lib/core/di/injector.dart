import '../database/app_database.dart';
import '../../features/dashboard/data/datasources/category_local_data_source.dart';
import '../../features/dashboard/data/datasources/dashboard_local_data_source.dart';
import '../../features/dashboard/data/repositories/category_repository_impl.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/repositories/category_repository.dart';
import '../../features/dashboard/domain/usecases/get_categories.dart';
import '../../features/dashboard/domain/usecases/get_dashboard_overview.dart';

/// Contenedor de dependencias sencillo, sin librerías externas
/// (get_it, injectable, etc.). Suficiente para conectar las capas.
class Injector {
  Injector._();

  static final CategoryRepository categoryRepository = CategoryRepositoryImpl(
    CategoryLocalDataSourceImpl(AppDatabase.instance),
  );

  static final GetCategories getCategories = GetCategories(categoryRepository);

  static final GetDashboardOverview getDashboardOverview = GetDashboardOverview(
    DashboardRepositoryImpl(DashboardLocalDataSourceImpl(), categoryRepository),
  );
}
