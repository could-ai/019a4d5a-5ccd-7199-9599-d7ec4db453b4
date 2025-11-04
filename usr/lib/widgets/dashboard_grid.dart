import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../models/dashboard_widget.dart';
import 'chart_widget.dart';
import 'gauge_widget.dart';
import 'control_button_widget.dart';
import 'text_display_widget.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: provider.widgets.length + 1, // +1 for empty slot
          itemBuilder: (context, index) {
            if (index == provider.widgets.length) {
              return DragTarget<DashboardWidget>(
                onAcceptWithDetails: (details) => provider.addWidget(details.data),
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.add, size: 48, color: Colors.grey),
                    ),
                  );
                },
              );
            }
            final widget = provider.widgets[index];
            return _buildWidgetTile(widget, provider);
          },
        );
      },
    );
  }

  Widget _buildWidgetTile(DashboardWidget widget, DashboardProvider provider) {
    Widget content;
    switch (widget.type) {
      case WidgetType.chart:
        content = ChartWidget(widget: widget);
        break;
      case WidgetType.gauge:
        content = GaugeWidget(widget: widget);
        break;
      case WidgetType.button:
        content = ControlButtonWidget(widget: widget);
        break;
      case WidgetType.text:
        content = TextDisplayWidget(widget: widget);
        break;
    }

    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => _configureWidget(widget, provider),
              ),
            ],
          ),
          Expanded(child: content),
        ],
      ),
    );
  }

  void _configureWidget(DashboardWidget widget, DashboardProvider provider) {
    // Simple configuration dialog - in real app, this would be more sophisticated
    showDialog(
      context: provider.context,
      builder: (context) => AlertDialog(
        title: Text('Configure ${widget.title}'),
        content: Text('Data Source: ${widget.dataSource}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
