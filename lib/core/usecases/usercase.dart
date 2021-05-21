import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:occasio_frontend_workings/core/errors/failures.dart';

/// This class is created to make all useCases conform to it
/// useCase format for all the business logic will be like this
/// it will have 2 parameters <Type , Parameters>
/// Type is the return type of the call function in the implemented class

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// this is a class for empty parameter
/// if a useCase has parameters i will put that in the implementation class
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
