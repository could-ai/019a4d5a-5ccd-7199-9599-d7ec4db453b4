import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';

enum WidgetType { chart, gauge, button, text }

class DashboardWidget {
  String id;
  WidgetType type;
  String title;
  String dataSource;
  Map<String, dynamic> config;

  DashboardWidget({
    required this.type,
    required this.title,
    required this.dataSource,
    Map<String, dynamic>? config,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString(),
       config = config ?? {};

  DashboardWidget copyWith({
    WidgetType? type,
    String? title,
    String? dataSource,
    Map<String, dynamic>? config,
  }) {
    return DashboardWidget(
      type: type ?? this.type,
      title: title ?? this.title,
      dataSource: dataSource ?? this.dataSource,
      config: config ?? this.config,
    )..id = this.id;
  }
}
