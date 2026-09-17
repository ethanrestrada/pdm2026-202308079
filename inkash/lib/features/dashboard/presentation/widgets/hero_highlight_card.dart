import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/hero_highlight.dart';

class HeroHighlightCard extends StatelessWidget {
  final HeroHighlight highlight;

  const HeroHighlightCard({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.superficie,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.borde),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(highlight.title, style: AppTextStyles.heroTitulo),
            const SizedBox(height: 2),
            Text(highlight.value, style: AppTextStyles.heroValor),
          ],
        ),
      ),
    );
  }
}
