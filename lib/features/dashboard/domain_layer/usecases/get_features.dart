import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/dashboard/domain_layer/entities/widget_entity.dart';

class GetFeatures {
  List<DashboardEntity> call() {
    return [
      DashboardEntity(index: 2, widget: const Center(child: Text('الرئيسية'))),
      DashboardEntity(index: 0, widget: const Center(child: Text('الطلبات'))),
      DashboardEntity(index: 1, widget: const Center(child: Text('العروض'))),
      DashboardEntity(index: 3, widget: const Center(child: Text('البضاعة'))),
      DashboardEntity(index: 4, widget: const Center(child: Text('التعاملات'))),
    ];
  }
}
