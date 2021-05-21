part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<UserEntity> userEntities;
  DashboardLoaded({@required this.userEntities}) : super();

  @override
  List<Object> get props => [userEntities];
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError({@required this.message});

  @override
  List<Object> get props => [message];
}
