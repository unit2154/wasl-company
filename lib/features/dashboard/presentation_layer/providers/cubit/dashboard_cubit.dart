import 'package:bloc/bloc.dart';
import 'package:wasl_company_app/features/dashboard/domain_layer/entities/widget_entity.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardInitial> {
  DashboardCubit() : super(DashboardInitial(currentIndex: 2, widgets: []));

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
