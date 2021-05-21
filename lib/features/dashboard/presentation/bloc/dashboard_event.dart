part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetMatchesEvent extends DashboardEvent {
  final int matchLevel;
  GetMatchesEvent({@required this.matchLevel});

  @override
  List<Object> get props => [matchLevel];
}
