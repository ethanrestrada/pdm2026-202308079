import 'package:sqflite/sqflite.dart';
import '../../../../core/database/app_database.dart';
import '../models/category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getAll();
  Future<CategoryModel?> getById(int id);
  Future<int> insert(
    String name, {
    required int iconCode,
    required String colorHex,
  });
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final AppDatabase _appDatabase;

  const CategoryLocalDataSourceImpl(this._appDatabase);

  @override
  Future<List<CategoryModel>> getAll() async {
    final Database db = await _appDatabase.database;
    final rows = await db.query('categories', orderBy: 'name ASC');
    return rows.map(CategoryModel.fromMap).toList();
  }

  @override
  Future<CategoryModel?> getById(int id) async {
    final Database db = await _appDatabase.database;
    final rows = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return CategoryModel.fromMap(rows.first);
  }

  @override
  Future<int> insert(
    String name, {
    required int iconCode,
    required String colorHex,
  }) async {
    final Database db = await _appDatabase.database;
    return db.insert('categories', {
      'name': name,
      'icon_code': iconCode,
      'color_hex': colorHex,
    });
  }
}
