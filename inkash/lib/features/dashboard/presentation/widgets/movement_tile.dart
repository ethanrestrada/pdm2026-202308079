import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/movement.dart';

class MovementTile extends StatelessWidget {
  final Movement movement;

  const MovementTile({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.iconoFondo,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(movement.category.icon, color: AppColors.lima),
      ),
      title: Text(movement.title, style: AppTextStyles.movimientoTitulo),
      subtitle: Text(
        '${movement.category.name} · ${movement.medioPago}',
        style: AppTextStyles.movimientoSubtitulo,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            movement.amountLabel,
            style: TextStyle(
              fontSize: 13,
              color: movement.isIncome ? AppColors.lima : AppColors.texto,
            ),
          ),
          Text(movement.date, style: AppTextStyles.movimientoFecha),
        ],
      ),
    );
  }
}
