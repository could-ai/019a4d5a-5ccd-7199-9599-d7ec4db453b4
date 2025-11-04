import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dashboard_widget.dart';
import '../providers/dashboard_provider.dart';

class DashboardProvider extends ChangeNotifier {
  final List<DashboardWidget> _widgets = [];
  BuildContext? _context;

  List<DashboardWidget> get widgets => _widgets;
  BuildContext? get context => _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  void addWidget(DashboardWidget widget) {
    _widgets.add(widget.copyWith());
    notifyListeners();
  }

  void removeWidget(String id) {
    _widgets.removeWhere((w) => w.id == id);
    notifyListeners();
  }

  void clearDashboard() {
    _widgets.clear();
    notifyListeners();
  }

  void updateWidget(String id, DashboardWidget updatedWidget) {
    final index = _widgets.indexWhere((w) => w.id == id);
    if (index != -1) {
      _widgets[index] = updatedWidget;
      notifyListeners();
    }
  }
}
