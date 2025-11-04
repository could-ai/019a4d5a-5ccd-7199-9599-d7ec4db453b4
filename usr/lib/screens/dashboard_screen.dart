import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/widget_palette.dart';
import '../widgets/dashboard_grid.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Future: Open settings for data sources
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: WidgetPalette(),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 4,
            child: DashboardGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DashboardProvider>().clearDashboard(),
        tooltip: 'Clear Dashboard',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
