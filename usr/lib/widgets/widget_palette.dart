import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../models/dashboard_widget.dart';

class WidgetPalette extends StatelessWidget {
  const WidgetPalette({super.key});

  @override
  Widget build(BuildContext context) {
    final availableWidgets = [
      DashboardWidget(type: WidgetType.chart, title: 'Line Chart', dataSource: 'Temperature'),
      DashboardWidget(type: WidgetType.gauge, title: 'Gauge', dataSource: 'Humidity'),
      DashboardWidget(type: WidgetType.button, title: 'Control Button', dataSource: 'Light Control'),
      DashboardWidget(type: WidgetType.text, title: 'Data Display', dataSource: 'Sensor Value'),
    ];

    return Container(
      color: Colors.grey[100],
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: availableWidgets.map((widget) => Draggable<DashboardWidget>(
          data: widget,
          feedback: Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(widget.title),
            ),
          ),
          child: Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.dataSource),
            ),
          ),
        )).toList(),
      ),
    );
  }
}
