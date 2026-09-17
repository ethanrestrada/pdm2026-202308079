import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onVerTodo;

  const SectionHeader({super.key, required this.title, this.onVerTodo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.seccionTitulo),
        const Spacer(),
        TextButton(
          onPressed: onVerTodo ?? () {},
          child: const Text('Ver todo', style: AppTextStyles.verTodo),
        ),
      ],
    );
  }
}
