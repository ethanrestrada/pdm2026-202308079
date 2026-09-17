import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAll();
  Future<Category?> getById(int id);
  Future<int> create(
    String name, {
    required int iconCode,
    required String colorHex,
  });
}
