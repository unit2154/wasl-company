import 'package:wasl_company_app/features/dashboard/domain_layer/entities/widget_entity.dart';

abstract class DashboardRepo {
  List<DashboardEntity> getFeature();
  void goToFeature(int index);
}
