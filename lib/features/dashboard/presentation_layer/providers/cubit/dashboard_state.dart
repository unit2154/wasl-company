part of 'dashboard_cubit.dart';

class DashboardInitial {
  final int currentIndex;
  final List<DashboardEntity> widgets;
  DashboardInitial({required this.currentIndex, required this.widgets});

  DashboardInitial copyWith({
    int? currentIndex,
    List<DashboardEntity>? widgets,
  }) {
    return DashboardInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      widgets: widgets ?? this.widgets,
    );
  }
}
