import 'package:flutter/cupertino.dart';
import 'package:occasio_frontend_workings/features/dashboard/data/datasources/remote_data_source.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/entities/userEntity.dart';
import 'package:occasio_frontend_workings/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:occasio_frontend_workings/features/dashboard/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  RemoteDataSourceImpl remoteDataSourceImpl;

  RepositoryImpl({@required this.remoteDataSourceImpl});

  @override
  Future<Either<Failure, List<UserEntity>>> getMatches({int matchLevel}) async {
    //check for network connection
    bool isConnected = true;
    if (isConnected) {
      final matches = await this.remoteDataSourceImpl.getMatches(matchLevel);
      return Right(matches);
    } else {
      return Left(InternetFailure());
    }
  }
}
