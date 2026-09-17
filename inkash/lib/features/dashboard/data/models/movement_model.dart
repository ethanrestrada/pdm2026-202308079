import '../../domain/entities/category.dart';
import '../../domain/entities/movement.dart';

/// Fila cruda de movimiento antes de resolver su categoría (aún no
/// conoce el objeto Category, solo el id que apunta a SQLite).
class MovementRow {
  final int categoryId;
  final String title;
  final String medioPago;
  final String amountLabel;
  final String date;
  final bool isIncome;

  const MovementRow({
    required this.categoryId,
    required this.title,
    required this.medioPago,
    required this.amountLabel,
    required this.date,
    this.isIncome = false,
  });

  factory MovementRow.fromMap(Map<String, dynamic> map) {
    return MovementRow(
      categoryId: map['categoryId'] as int,
      title: map['title'] as String,
      medioPago: map['medioPago'] as String,
      amountLabel: map['amountLabel'] as String,
      date: map['date'] as String,
      isIncome: map['isIncome'] as bool? ?? false,
    );
  }
}

/// Modelo de datos ya resuelto con su Category (viene de SQLite).
class MovementModel extends Movement {
  const MovementModel({
    required super.category,
    required super.title,
    required super.medioPago,
    required super.amountLabel,
    required super.date,
    super.isIncome,
  });

  factory MovementModel.fromRow(MovementRow row, Category category) {
    return MovementModel(
      category: category,
      title: row.title,
      medioPago: row.medioPago,
      amountLabel: row.amountLabel,
      date: row.date,
      isIncome: row.isIncome,
    );
  }
}
