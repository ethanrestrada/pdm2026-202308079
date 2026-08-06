import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountsGrid extends StatelessWidget {
  const AccountsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos una lista estática de cuentas para este ejemplo (en un patrón real, esto vendría de un BLoC/Provider)
    final List<Map<String, dynamic>> accounts = [
      {
        'icon': Icons.savings_outlined,
        'name': 'Ahorro familiar',
        'amount': 'Q 500.00',
      },
      {
        'icon': CupertinoIcons.sparkles,
        'name': 'Imprevistos',
        'amount': 'Q 450.00',
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'name': 'Billetera',
        'amount': 'Q 400.00',
      },
    ];

    return SizedBox(
      height: 140, // Altura del carrusel
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: accounts.length + 1,
        itemBuilder: (context, index) {
          final isLast = index == accounts.length;
          final widget = isLast
              ? _NewAccountButton()
              : _AccountCard(
                  icon: accounts[index]['icon'],
                  name: accounts[index]['name'],
                  amount: accounts[index]['amount'],
                );

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0.0 : 6.0,
              right: isLast ? 0.0 : 6.0,
            ),
            child: SizedBox(
              width: 140, // Ancho de cada tarjeta del carrusel
              child: widget,
            ),
          );
        },
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String amount;

  const _AccountCard({
    required this.icon,
    required this.name,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    // Color neón cyan del estilo premium
    const primaryNeon = Color(0xFF00F2FE);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // Gradiente oscuro (del estilo premium)
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1E2E), Color(0xFF151522)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono grande en la esquina superior izquierda
          Icon(icon, color: primaryNeon, size: 32),

          // Detalles en la parte inferior
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Para nombres largos
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900, // Fuente gruesa
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NewAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(
          0xFF0D0E15,
        ), // Fondo de pantalla, pero con borde punteado
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 1.5,
          style: BorderStyle.none, // Ocultamos el borde por defecto
        ),
      ),
      // Usamos CustomPaint para dibujar el borde punteado
      child: CustomPaint(
        painter: _DottedBorderPainter(color: Colors.white.withValues(alpha: 0.2)),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white30, size: 32),
              SizedBox(height: 8),
              Text(
                'Nueva\nCuenta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pintor para el borde punteado del botón 'Nueva Cuenta'
class _DottedBorderPainter extends CustomPainter {
  final Color color;
  _DottedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5;
    const double dashSpace = 3;
    final radius = Radius.circular(24.0);

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(Offset.zero & size, radius));

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
