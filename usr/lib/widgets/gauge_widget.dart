import 'package:flutter/material.dart';
import '../models/dashboard_widget.dart';

class GaugeWidget extends StatefulWidget {
  final DashboardWidget widget;

  const GaugeWidget({super.key, required this.widget});

  @override
  State<GaugeWidget> createState() => _GaugeWidgetState();
}

class _GaugeWidgetState extends State<GaugeWidget> {
  double _value = 50;

  @override
  void initState() {
    super.initState();
    _simulateRealTimeData();
  }

  void _simulateRealTimeData() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _value = 30 + (70 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000);
        });
        _simulateRealTimeData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.widget.dataSource}: ${_value.toStringAsFixed(1)}%'),
          const SizedBox(height: 16),
          CircularProgressIndicator(
            value: _value / 100,
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      ),
    );
  }
}
