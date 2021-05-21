import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:occasio_frontend_workings/core/errors/failures.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';

/// this class defines the contract for the data repository
abstract class Repository {
  //register new user
  Future<Either<Failure, List<UserEntity>>> getMatches({
    @required int matchLevel,
  });
}
