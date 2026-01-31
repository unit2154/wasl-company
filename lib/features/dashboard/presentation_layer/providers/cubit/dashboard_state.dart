part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {
  final int currentIndex;
  final List<DashboardEntity> widgets;
  DashboardInitial({required this.currentIndex, required this.widgets});
}

final class GoToFeature extends DashboardState {
  final int index;
  GoToFeature({required this.index});
}
