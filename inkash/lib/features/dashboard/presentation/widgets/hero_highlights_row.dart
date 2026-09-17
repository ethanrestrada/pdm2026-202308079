import 'package:flutter/material.dart';
import '../../domain/entities/hero_highlight.dart';
import 'hero_highlight_card.dart';

class HeroHighlightsRow extends StatelessWidget {
  final List<HeroHighlight> highlights;

  const HeroHighlightsRow({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < highlights.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          HeroHighlightCard(highlight: highlights[i]),
        ],
      ],
    );
  }
}
