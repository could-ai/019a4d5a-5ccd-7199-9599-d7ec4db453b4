import 'package:flutter/material.dart';
import '../models/dashboard_widget.dart';

class ControlButtonWidget extends StatelessWidget {
  final DashboardWidget widget;

  const ControlButtonWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Command sent to ${widget.dataSource}')),
          );
          // Future: Send actual IoT command
        },
        child: Text(widget.title),
      ),
    );
  }
}
