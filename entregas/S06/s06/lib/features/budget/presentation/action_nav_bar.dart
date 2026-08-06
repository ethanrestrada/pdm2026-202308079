import 'package:flutter/cupertino.dart'; // Para CupertinoIcons
import 'package:flutter/material.dart';

class ActionNavBar extends StatelessWidget {
  const ActionNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el color neón principal y el de acento
    const primaryNeon = Color(0xFF00F2FE);
    const secondaryNeon = Color(0xFFFF7E40);

    return Container(
      // Estilo de la tarjeta principal superior
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E), // Fondo de tarjeta (del estilo premium)
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.add_circle_outline_rounded,
            label: 'Gasto',
            color: primaryNeon,
          ),
          _NavItem(
            icon: Icons.flag_outlined, // Un banderín para 'Metas'
            label: 'Metas',
            color: secondaryNeon,
          ),
          _NavItem(
            icon: CupertinoIcons
                .money_dollar, // Icono de dólar para 'Pagos Fijos'
            label: 'Pagos\nFijos',
            color: Colors.white, // Blanco para neutral
            isMultiline: true,
          ),
          _NavItem(
            icon: CupertinoIcons.tag, // Etiqueta para 'Categorías'
            label: 'Categorías',
            color: primaryNeon,
          ),
          _NavItem(
            icon: Icons.track_changes_outlined, // Una diana para 'Presupuestos'
            label: 'Presupuestos',
            color: secondaryNeon,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isMultiline;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.color,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 28), // Icono grande
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color.withValues(alpha: 0.8), // Texto un poco más tenue
            fontSize: 11,
            fontWeight: FontWeight.w600,
            height: isMultiline ? 1.1 : 1.3, // Ajuste para multilínea
          ),
        ),
      ],
    );
  }
}
