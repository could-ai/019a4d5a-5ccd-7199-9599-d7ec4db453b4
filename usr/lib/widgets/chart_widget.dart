import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../models/dashboard_widget.dart';
import '../providers/dashboard_provider.dart';

class ChartWidget extends StatefulWidget {
  final DashboardWidget widget;

  const ChartWidget({super.key, required this.widget});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<FlSpot> _spots = [];

  @override
  void initState() {
    super.initState();
    _simulateRealTimeData();
  }

  void _simulateRealTimeData() {
    // Simulate real-time data updates
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _spots.add(FlSpot(_spots.length.toDouble(), (50 + (20 * (1 - 2 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000))).roundToDouble()));
          if (_spots.length > 20) _spots.removeAt(0);
        });
        _simulateRealTimeData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: _spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
      ),
    );
  }
}
