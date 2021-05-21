import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/usecases/get_matches_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetMatchesUseCase getMatchesUseCase;
  DashboardBloc({
    @required this.getMatchesUseCase,
  }) : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is GetMatchesEvent) {
      final matchesOrError = await getMatchesUseCase
          .call(ParamsForGetMatchesUseCase(matchLevel: event.matchLevel));

      // print(matchesOrError);

      yield* matchesOrError.fold((error) {
        throw UnimplementedError;
      }, (userEntities) async* {
        print("yeild loading");

        yield DashboardLoading();

        // print(userEntity);
        yield DashboardLoaded(userEntities: userEntities);
      });
    }
  }
}
