import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Infraestructura compartida: abre/crea la base SQLite de la app.
/// No pertenece a ningún feature en particular, por eso vive en core/.
class AppDatabase {
  AppDatabase._internal();
  static final AppDatabase instance = AppDatabase._internal();

  static Database? _db;

  Future<Database> get database async {
    _db ??= await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'inkash.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            icon_code INTEGER NOT NULL,
            color_hex TEXT NOT NULL
          )
        ''');
        await _seedCategories(db);
      },
    );
  }

  Future<void> _seedCategories(Database db) async {
    final seed = [
      {'name': 'Transporte', 'icon_code': 0xe1d7, 'color_hex': 'FFC8F54E'},
      {'name': 'Súper y comida', 'icon_code': 0xe59c, 'color_hex': 'FFC8F54E'},
      {'name': 'Ingreso', 'icon_code': 0xe5d8, 'color_hex': 'FFC8F54E'},
      {'name': 'Entretenimiento', 'icon_code': 0xef4c, 'color_hex': 'FFC8F54E'},
      {'name': 'Servicios', 'icon_code': 0xea0b, 'color_hex': 'FFC8F54E'},
    ];
    for (final cat in seed) {
      await db.insert('categories', cat);
    }
  }
}
