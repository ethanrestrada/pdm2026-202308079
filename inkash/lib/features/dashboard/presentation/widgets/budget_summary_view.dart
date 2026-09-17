import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/budget_summary.dart';

class BudgetSummaryView extends StatelessWidget {
  final BudgetSummary budget;

  const BudgetSummaryView({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('TE QUEDAN DISPONIBLES', style: AppTextStyles.label),
        Text(
          'Q${budget.disponible.toStringAsFixed(2)}',
          style: AppTextStyles.saldoDisponible,
        ),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: budget.progreso,
          color: AppColors.lima,
          minHeight: 8.0,
        ),
        const SizedBox(height: 7),
        Text(
          'Has usado Q${budget.usado.toStringAsFixed(2)} de '
          'Q${budget.total.toStringAsFixed(2)}',
          style: AppTextStyles.usoResumen,
        ),
      ],
    );
  }
}
