import 'package:flutter/foundation.dart';
import '../../domain/entities/dashboard_overview.dart';
import '../../domain/usecases/get_dashboard_overview.dart';

/// Estado de presentación del dashboard. Usa ChangeNotifier (nativo de
/// Flutter) para no depender de paquetes externos de manejo de estado.
class DashboardController extends ChangeNotifier {
  final GetDashboardOverview _getDashboardOverview;

  DashboardController(this._getDashboardOverview);

  DashboardOverview? _overview;
  bool _isLoading = false;
  Object? _error;

  DashboardOverview? get overview => _overview;
  bool get isLoading => _isLoading;
  Object? get error => _error;

  Future<void> load() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _overview = await _getDashboardOverview();
    } catch (e) {
      _error = e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
