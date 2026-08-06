import 'package:flutter/material.dart';
import 'features/budget/presentation/widgets/budget_card.dart';
import 'features/budget/presentation/action_nav_bar.dart';
import 'features/budget/presentation/widgets/accounts_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estado Presupuestal',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E15),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Saludo superior
                const Text(
                  '¡HOLA ETHAN!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Tarjeta principal "Estado Presupuestal"
                const BudgetCard(),
                const SizedBox(height: 24),

                // Barra de acciones de navegación rápida
                const ActionNavBar(),
                const SizedBox(height: 28),

                // Sección "Mis Cuentas"
                const Text(
                  'Mis Cuentas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),

                // Grid de cuentas
                const AccountsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

