import 'package:flutter/material.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/budget_summary_view.dart';
import '../widgets/hero_highlights_row.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/movement_tile.dart';
import '../widgets/section_header.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final DashboardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DashboardController(Injector.getDashboardOverview);
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final overview = _controller.overview;

            if (_controller.isLoading && overview == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_controller.error != null && overview == null) {
              return Center(
                child: Text(
                  'No se pudo cargar el dashboard',
                  style: TextStyle(color: AppColors.texto),
                ),
              );
            }
            if (overview == null) return const SizedBox.shrink();

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(overview.saludo),
                    Text(overview.periodo, style: const TextStyle(color: AppColors.muted)),
                  ],
                ),
                const SizedBox(height: 22),
                BudgetSummaryView(budget: overview.budget),
                const SizedBox(height: 22),
                HeroHighlightsRow(highlights: overview.heroHighlights),
                const SizedBox(height: 28),
                const SectionHeader(title: 'Últimos movimientos'),
                for (final movement in overview.movements)
                  MovementTile(movement: movement),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const MainBottomNav(),
    );
  }
}
