import 'package:flutter/material.dart';
import '../models/dashboard_widget.dart';

class TextDisplayWidget extends StatefulWidget {
  final DashboardWidget widget;

  const TextDisplayWidget({super.key, required this.widget});

  @override
  State<TextDisplayWidget> createState() => _TextDisplayWidgetState();
}

class _TextDisplayWidgetState extends State<TextDisplayWidget> {
  String _value = '0.0';

  @override
  void initState() {
    super.initState();
    _simulateRealTimeData();
  }

  void _simulateRealTimeData() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _value = (20 + 10 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).toStringAsFixed(1);
        });
        _simulateRealTimeData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${widget.widget.dataSource}: $_value',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
