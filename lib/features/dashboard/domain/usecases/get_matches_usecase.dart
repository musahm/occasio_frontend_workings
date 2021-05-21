import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:occasio_frontend_workings/core/errors/failures.dart';
import 'package:occasio_frontend_workings/core/usecases/usercase.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/repositories/repository.dart';

class ParamsForGetMatchesUseCase extends Equatable {
  final int matchLevel;

  ParamsForGetMatchesUseCase({
    @required this.matchLevel,
  });

  @override
  List<Object> get props => [matchLevel];
}

class GetMatchesUseCase
    implements UseCase<List<UserEntity>, ParamsForGetMatchesUseCase> {
  final Repository repository;

  GetMatchesUseCase(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(
      ParamsForGetMatchesUseCase params) async {
    print("getting matches");
    return await repository.getMatches(matchLevel: params.matchLevel);
  }
}
