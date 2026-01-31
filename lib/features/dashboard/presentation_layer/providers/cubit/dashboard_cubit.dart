import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasl_company_app/features/dashboard/domain_layer/entities/widget_entity.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
}
