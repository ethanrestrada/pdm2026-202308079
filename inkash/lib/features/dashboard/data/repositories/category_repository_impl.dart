import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_local_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  const CategoryRepositoryImpl(this.localDataSource);

  @override
  Future<List<Category>> getAll() => localDataSource.getAll();

  @override
  Future<Category?> getById(int id) => localDataSource.getById(id);

  @override
  Future<int> create(
    String name, {
    required int iconCode,
    required String colorHex,
  }) {
    return localDataSource.insert(name, iconCode: iconCode, colorHex: colorHex);
  }
}
